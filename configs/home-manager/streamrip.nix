{
  config,
  lib,
  pkgs,
  ...
}:
let
  tomlFormat = pkgs.formats.toml { };

  streamripConfigFile = tomlFormat.generate "streamrip-config.toml" {
    downloads = {
      folder = "${config.home.homeDirectory}/Music/z-new-downloads";
      source_subdirectories = false;
      disc_subdirectories = false;
      concurrency = true;
      max_connections = 6;
      requests_per_minute = 60;
      verify_ssl = true;
    };

    qobuz = {
      quality = 4;
      download_booklets = true;
      use_auth_token = true;
      email_or_userid = "";
      password_or_token = "";
      app_id = "";
      secrets = [ "" ];
    };

    tidal = {
      quality = 3;
      download_videos = true;
      user_id = "";
      country_code = "";
      access_token = "";
      refresh_token = "";
      token_expiry = "";
    };

    deezer = {
      quality = 2;
      arl = "";
      use_deezloader = false;
      deezloader_warnings = true;
    };

    soundcloud = {
      quality = 0;
      client_id = "";
      app_version = "";
    };

    youtube = {
      quality = 0;
      download_videos = false;
      video_downloads_folder = "${config.home.homeDirectory}/StreamripDownloads/YouTubeVideos";
    };

    database = {
      downloads_enabled = true;
      downloads_path = "${config.xdg.configHome}/streamrip/downloads.db";
      failed_downloads_enabled = true;
      failed_downloads_path = "${config.xdg.configHome}/streamrip/failed_downloads.db";
    };

    conversion = {
      enabled = false;
      codec = "FLAC";
      sampling_rate = 192000;
      bit_depth = 24;
      lossy_bitrate = 320;
    };

    qobuz_filters = {
      extras = false;
      repeats = true;
      non_albums = false;
      features = false;
      non_studio_albums = false;
      non_remaster = false;
    };

    artwork = {
      embed = true;
      embed_size = "original";
      embed_max_width = -1;
      save_artwork = false;
      saved_max_width = -1;
    };

    metadata = {
      set_playlist_to_album = false;
      renumber_playlist_tracks = false;
      exclude = [ ];
    };

    filepaths = {
      add_singles_to_folder = false;
      folder_format = "{albumartist} - {title} ({year}) [{container}]";
      track_format = "{tracknumber:02}. {artist} - {title}";
      restrict_characters = false;
      truncate_to = 120;
    };

    lastfm = {
      source = "qobuz";
      fallback_source = "deezer";
    };

    cli = {
      text_output = true;
      progress_bars = true;
      max_search_results = 100;
    };

    misc = {
      version = "2.0.6";
      check_for_updates = true;
    };
  };
in
{
  home.activation.streamripConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target="${config.xdg.configHome}/streamrip/config.toml"
    if [ ! -e "$target" ]; then
      install -D --mode=600 --owner=${config.home.username} --group=users ${streamripConfigFile} "$target"
    fi
  '';
}
