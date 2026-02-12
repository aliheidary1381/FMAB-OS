set -g fish_greeting ""

function run
  if test (count $argv) -eq 0
    echo "Usage: run <package>"
    return 1
  end

  nix run nixpkgs#$argv[1] -- $argv[2..-1]
end

function where
  if test (count $argv) -ne 1
    echo "Usage: where <nix package name>"
    return 1
  end

  set store_derivation (nix-instantiate '<nixpkgs>' -A $argv[1] --quiet --quiet --quiet)

  echo $store_derivation
  nix-store --query --outputs $store_derivation # nix eval --raw nixpkgs#"$argv[1]".outPath
end

function mp3
  if test (count $argv) -ne 1
    echo "Usage: mp3 <file.flac>"
    return 1
  end

  set infile $argv[1]
  set outfile (string replace -r '\.flac$' '.mp3' -- $infile)

  ffmpeg -hide_banner -loglevel warning -stats -i "$infile" -map 0 -codec:v copy -codec:a libmp3lame -id3v2_version 3 -qscale:a 0 "$outfile"
end

function clip
    if test (count $argv) -ne 3
        echo "Usage: clip <input.mkv> <start hh:mm:ss.mmm> <end hh:mm:ss.mmm>"
        return 1
    end

    set input $argv[1]
    set start $argv[2]
    set end $argv[3]

    if not test -f $input
        echo "Input file not found: $input"
        return 1
    end

    set base (string replace -r '\.mkv$' '' $input)
    set sub "$base.srt"
    set output "$base.mp4"
    set font "IRANSansX Light"
    set sub_is_internal false

    if not test -f $sub
        set sub $input
        set sub_is_internal true
    end

    set vf "subtitles='$sub':force_style='FontName=$font,FontSize=24',scale=-2:480:flags=lanczos"

    if $sub_is_internal
        set sub_codec (ffprobe -v error -select_streams s:0 -show_entries stream=codec_name -of default=nw=1:nk=1 $input)

        if string match -q "hdmv_pgs_subtitle" $sub_codec; or string match -q "dvd_subtitle" $sub_codec
            set vfc "[0:v:0][0:s:0]overlay,scale=-2:480:flags=lanczos[out]"
            ffmpeg -hide_banner -loglevel warning -stats -ss $start -copyts -i $input -ss $start -to $end -filter_complex "$vfc" -map "[out]" -map 0:a:0 -c:v libx264 -crf 21 -pix_fmt yuv420p -c:a aac -b:a 128k -ac 2 -movflags +faststart $output
            return
        end

        if not string match -q "subrip" $sub_codec; and not string match -q "ass" $sub_codec
            set vf "scale=-2:480:flags=lanczos"
        end
    end

    ffmpeg -hide_banner -loglevel warning -stats -ss $start -copyts -i $input -ss $start -to $end -map 0:v:0 -map 0:a:0 -vf "$vf" -c:v libx264 -crf 21 -pix_fmt yuv420p -c:a aac -b:a 128k -ac 2 -movflags +faststart $output
end

function shift
    if test (count $argv) -ne 2
        echo "Usage: shift <subtitle.srt> <seconds.miliseconds>"
        return 1
    end

    set sub $argv[1]
    set seconds $argv[2]

    if not test -f $sub
        echo "Input file not found: $input"
        return 1
    end

    mv $sub tmp.srt
    ffmpeg -hide_banner -loglevel warning -stats -itsoffset $seconds -i "tmp.srt" -c copy $sub
    rm tmp.srt
end
