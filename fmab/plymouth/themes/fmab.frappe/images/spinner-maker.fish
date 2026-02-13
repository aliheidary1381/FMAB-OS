#!/usr/bin/env fish

if test (count $argv) -ne 1
    echo "Usage: spinner-maker.fish <input.svg>"
    exit 1
end

set input_svg $argv[1]
set workdir "spinner"
mkdir -p $workdir
set base_svg "$workdir/spinner.svg"
cp $input_svg $base_svg
set cx 875
set cy 911

for i in (seq 0 119)
    set angle (math "$i * 3")
    set temp_svg "$workdir/spinner$angle.svg"
    set output_png "$workdir/spinner$angle.png"
    cp $base_svg $temp_svg
    sed -i "s/rotate(-0 $cx $cy)/rotate(-$angle $cx $cy)/" $temp_svg
    inkscape $temp_svg --export-type=png --export-width=28 --export-height=28 --export-filename=$output_png
    rm $temp_svg
end

rm $base_svg
