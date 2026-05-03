{
  programs.plasma = {
    enable = true;
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
    krunner.position = "center";
    fonts = {
      general = {
        family = "IRANSansX Light";
        pointSize = 12;
        weight = "normal";
      };
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
    kscreenlocker.autoLock = false;
    kscreenlocker.lockOnResume = true;
    kscreenlocker.lockOnStartup = false;
    kscreenlocker.passwordRequired = false;
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
