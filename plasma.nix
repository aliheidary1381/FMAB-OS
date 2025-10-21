{
  pkgs,
  ...
}:
let
  my-pics = pkgs.stdenv.mkDerivation {
    name = "fmab-dist";
    src = ./images;
    installPhase = ''
      mkdir -p $out/share/wallpapers/fmab/contents/images
      mkdir -p $out/share/wallpapers/fmab/contents/images_dark
      cp $src/plasma-desktop-light-background.png $out/share/wallpapers/fmab/contents/images/1920x1080.png
      cp $src/plasma-desktop-dark-background.png $out/share/wallpapers/fmab/contents/images_dark/1920x1080.png
      cp $src/metadata.json $out/share/wallpapers/fmab/metadata.json
      mkdir -p $out/share/lockscreens/fmab/contents/images
      cp $src/sddm-and-plasma-screenlocker-background.png $out/share/lockscreens/fmab/contents/images/1920x1080.png
      mkdir -p $out/share/menu/fmab/contents/icons
      cp $src/icon.png $out/share/menu/fmab/contents/icons/icon.png
    '';
  };
in
{
  programs.plasma = {
    enable = true;
    workspace.lookAndFeel = "org.kde.breezedark.desktop";
    workspace.wallpaper = [ "${my-pics}/share/wallpapers/fmab/contents/images_dark/1920x1080.png" ];
    kscreenlocker.appearance.wallpaper = "${my-pics}/share/lockscreens/fmab/contents/images/1920x1080.png";
    workspace.colorScheme = "CatppuccinFrappeYellow"; # Note: krita theme should be selected manually in the app
    # workspace.splashScreen = ?; # TODO
    # configFile."plasma-org.kde.plasma.desktop-appletsrc" = {
    #   "Containments.172.Applets.173.Configuration.General" = {
    #     icon = "${my-pics}/share/menu/fmab/contents/icons/icon.png";
    #   };
    # };
    desktop.icons.folderPreviewPopups = true;
    desktop.widgets = [
      {
        plasmusicToolbar = {
          background = "transparentShadow";
          position = {
            horizontal = 51;
            vertical = 300;
          };
          size = {
            height = 400;
            width = 250;
          };
        };
      }
    ];
    fonts = {
      # general = {
      #   family = "IRANSansX";
      #   pointSize = 12;
      # };
      # menu = {
      #   family = "IRANSansX";
      #   pointSize = 10;
      # };
      # toolbar = {
      #   family = "IRANSansX";
      #   pointSize = 10;
      # };
      # windowTitle = {
      #   family = "IRANSansX";
      #   pointSize = 10;
      # };
      # small = {
      #   family = "IRANSansX";
      #   pointSize = 8;
      # };
      fixedWidth = {
        family = "FiraCode Nerd Font Mono";
        pointSize = 12;
      };
    };
    input.keyboard.layouts = [
      {
        layout = "us";
        displayName = "en";
      }
      {
        layout = "ir";
        displayName = "fa";
      }
    ];
    input.keyboard.numlockOnStartup = "on";
    input.touchpads = [
      {
        name = "DELL0810:00 044E:120A Touchpad";
        productId = "120a";
        vendorId = "044e";
        enable = true;
        naturalScroll = true;
        pointerSpeed = 0.7;
        scrollSpeed = 0.3;
      }
    ];
    krunner.position = "center";
    kscreenlocker.autoLock = false;
    kscreenlocker.lockOnResume = true;
    kscreenlocker.lockOnStartup = true;
    kscreenlocker.passwordRequired = true;
    kwin.effects.blur.enable = true;
    kwin.effects.blur.strength = 5;
    kwin.effects.shakeCursor.enable = false;
    kwin.titlebarButtons.right = [
      "keep-above-windows"
      "minimize"
      "maximize"
      "close"
    ];
    kwin.titlebarButtons.left = [
      "application-menu"
      "more-window-actions"
    ];
    powerdevil.AC.autoSuspend.action = "nothing";
    powerdevil.AC.dimDisplay.enable = false;
    powerdevil.AC.powerButtonAction = "turnOffScreen";
    powerdevil.AC.powerProfile = "performance";
    powerdevil.AC.whenLaptopLidClosed = "turnOffScreen";
    powerdevil.battery.autoSuspend.action = "nothing";
    powerdevil.battery.dimDisplay.enable = false;
    powerdevil.battery.powerButtonAction = "turnOffScreen";
    powerdevil.battery.powerProfile = "powerSaving";
    powerdevil.battery.whenLaptopLidClosed = "turnOffScreen";
  };
}
