{ pkgs, lib, config, ... }:
let
	dmsConfig = pkgs.writeText "dms-settings.json" (builtins.toJSON {
    currentThemeName = "custom";
    currentThemeCategory = "registry";
    customThemeFile = "/home/ali/.config/DankMaterialShell/themes/catppuccin/theme.json";
    registryThemeVariants = {
      catppuccin = {
        dark = {
          flavor = "frappe";
          accent = "yellow";
        };
        light = {
          flavor = "latte";
          accent = "yellow";
        };
      };
    };
    matugenScheme = "scheme-tonal-spot";
    matugenContrast = 0;
    runUserMatugenTemplates = true;
    matugenTargetMonitor = "";
    popupTransparency = 1;
    dockTransparency = 1;
    widgetBackgroundColor = "sch";
    widgetBackgroundCustomColor = "#6750A4";
    widgetBackgroundCustomStrength = 0.5;
    widgetColorMode = "default";
    controlCenterTileColorMode = "primary";
    buttonColorMode = "primary";
    cornerRadius = 12;
    niriLayoutGapsOverride = -1;
    niriLayoutRadiusOverride = -1;
    niriLayoutBorderSize = -1;
    hyprlandLayoutGapsOverride = -1;
    hyprlandLayoutGapsOutOverride = -1;
    hyprlandLayoutRadiusOverride = -1;
    hyprlandLayoutBorderSize = -1;
    hyprlandResizeOnBorder = false;
    mangoLayoutGapsOverride = -1;
    mangoLayoutGapsOutOverride = -1;
    mangoLayoutRadiusOverride = -1;
    mangoLayoutBorderSize = -1;
    mangoTrackpadNaturalScrolling = true;
    firstDayOfWeek = -1;
    showWeekNumber = false;
    calendarBackend = "auto";
    clockFormat = "12h";
    showSeconds = true;
    padHours12Hour = true;
    useFahrenheit = false;
    windSpeedUnit = "kmh";
    nightModeEnabled = false;
    animationSpeed = 1;
    customAnimationDuration = 500;
    syncComponentAnimationSpeeds = true;
    popoutAnimationSpeed = 1;
    popoutCustomAnimationDuration = 150;
    modalAnimationSpeed = 1;
    modalCustomAnimationDuration = 150;
    enableRippleEffects = true;
    animationVariant = 0;
    motionEffect = 0;
    m3ElevationEnabled = true;
    m3ElevationIntensity = 12;
    m3ElevationOpacity = 30;
    m3ElevationColorMode = "default";
    m3ElevationLightDirection = "top";
    m3ElevationCustomColor = "#000000";
    modalElevationEnabled = true;
    popoutElevationEnabled = true;
    barElevationEnabled = false;
    blurEnabled = true;
    blurForegroundLayers = true;
    blurLayerOutlineOpacity = 0.12;
    blurBorderEnabled = true;
    blurBorderColor = "outline";
    blurBorderCustomColor = "#ffffff";
    blurBorderOpacity = 0.35;
    wallpaperFillMode = "Fill";
    blurredWallpaperLayer = false;
    blurWallpaperOnOverview = false;
    wallpaperBackgroundColorMode = "black";
    wallpaperBackgroundCustomColor = "#000000";
    showLauncherButton = true;
    showWorkspaceSwitcher = true;
    showFocusedWindow = true;
    showWeather = true;
    showMusic = true;
    showClipboard = true;
    showCpuUsage = true;
    showMemUsage = true;
    showCpuTemp = true;
    showGpuTemp = true;
    selectedGpuIndex = 0;
    enabledGpuPciIds = [];
    showSystemTray = true;
    systemTrayIconTintMode = "none";
    systemTrayIconTintSaturation = 50;
    systemTrayIconTintStrength = 135;
    showClock = true;
    showNotificationButton = true;
    showBattery = true;
    showBatteryPercent = true;
    showBatteryPercentOnlyOnBattery = false;
    showBatteryTime = false;
    showBatteryTimeOnlyOnBattery = false;
    batteryPillStyle = false;
    batteryPillPercentSign = false;
    showControlCenterButton = true;
    showCapsLockIndicator = true;
    controlCenterShowNetworkIcon = true;
    controlCenterShowBluetoothIcon = true;
    controlCenterShowAudioIcon = true;
    controlCenterShowAudioPercent = false;
    controlCenterShowVpnIcon = true;
    controlCenterShowBrightnessIcon = false;
    controlCenterShowBrightnessPercent = false;
    controlCenterShowMicIcon = false;
    controlCenterShowMicPercent = true;
    controlCenterShowBatteryIcon = false;
    controlCenterShowPrinterIcon = false;
    controlCenterShowScreenSharingIcon = true;
    controlCenterShowIdleInhibitorIcon = false;
    controlCenterShowDoNotDisturbIcon = false;
    showPrivacyButton = true;
    privacyShowMicIcon = false;
    privacyShowCameraIcon = false;
    privacyShowScreenShareIcon = false;
    controlCenterWidgets = [
      {
        id = "volumeSlider";
        enabled = true;
        width = 50;
      }
      {
        id = "brightnessSlider";
        enabled = true;
        width = 50;
      }
      {
        id = "wifi";
        enabled = true;
        width = 50;
      }
      {
        id = "bluetooth";
        enabled = true;
        width = 50;
      }
      {
        id = "audioOutput";
        enabled = true;
        width = 50;
      }
      {
        id = "audioInput";
        enabled = true;
        width = 50;
      }
      {
        id = "nightMode";
        enabled = true;
        width = 50;
      }
      {
        id = "darkMode";
        enabled = true;
        width = 50;
      }
    ];
    showWorkspaceIndex = false;
    showWorkspaceName = false;
    showWorkspacePadding = false;
    workspaceScrolling = false;
    showWorkspaceApps = false;
    workspaceDragReorder = true;
    maxWorkspaceIcons = 3;
    workspaceAppIconSizeOffset = 0;
    groupWorkspaceApps = true;
    groupActiveWorkspaceApps = false;
    workspaceFollowFocus = false;
    showOccupiedWorkspacesOnly = false;
    reverseScrolling = false;
    dwlShowAllTags = false;
    workspaceActiveAppHighlightEnabled = false;
    workspaceColorMode = "default";
    workspaceFocusedCustomColor = "#6750A4";
    workspaceOccupiedColorMode = "none";
    workspaceOccupiedCustomColor = "#625B71";
    workspaceUnfocusedColorMode = "default";
    workspaceUnfocusedCustomColor = "#49454E";
    workspaceUrgentColorMode = "default";
    workspaceUrgentCustomColor = "#B3261E";
    workspaceFocusedBorderEnabled = false;
    workspaceFocusedBorderColor = "primary";
    workspaceFocusedBorderCustomColor = "#6750A4";
    workspaceFocusedBorderThickness = 2;
    workspaceUnfocusedMonitorSeparateAppearance = false;
    workspaceUnfocusedMonitorColorMode = "default";
    workspaceUnfocusedMonitorFocusedCustomColor = "#6750A4";
    workspaceUnfocusedMonitorOccupiedColorMode = "none";
    workspaceUnfocusedMonitorOccupiedCustomColor = "#625B71";
    workspaceUnfocusedMonitorUnfocusedColorMode = "default";
    workspaceUnfocusedMonitorUnfocusedCustomColor = "#49454E";
    workspaceUnfocusedMonitorUrgentColorMode = "default";
    workspaceUnfocusedMonitorUrgentCustomColor = "#B3261E";
    workspaceUnfocusedMonitorBorderEnabled = false;
    workspaceUnfocusedMonitorBorderColor = "primary";
    workspaceUnfocusedMonitorBorderCustomColor = "#6750A4";
    workspaceUnfocusedMonitorBorderThickness = 2;
    workspaceNameIcons = {};
    waveProgressEnabled = true;
    scrollTitleEnabled = true;
    mediaAdaptiveWidthEnabled = true;
    audioVisualizerEnabled = true;
    mediaUseAlbumArtAccent = false;
    audioScrollMode = "volume";
    audioWheelScrollAmount = 5;
    audioDeviceScrollVolumeEnabled = false;
    mediaExcludePlayers = [];
    clockCompactMode = false;
    focusedWindowCompactMode = false;
    focusedWindowSize = 1;
    focusedWindowShowIcon = true;
    runningAppsCompactMode = true;
    barMaxVisibleApps = 0;
    barMaxVisibleRunningApps = 0;
    barShowOverflowBadge = true;
    trayAutoOverflow = true;
    trayPopupSingleLine = true;
    trayMaxVisibleItems = 0;
    appsDockHideIndicators = false;
    appsDockColorizeActive = false;
    appsDockActiveColorMode = "primary";
    appsDockEnlargeOnHover = false;
    appsDockEnlargePercentage = 125;
    appsDockIconSizePercentage = 100;
    keyboardLayoutNameCompactMode = false;
    keyboardLayoutNameShowIcon = false;
    runningAppsCurrentWorkspace = true;
    runningAppsGroupByApp = false;
    runningAppsCurrentMonitor = false;
    appIdSubstitutions = [];
    centeringMode = "index";
    clockDateFormat = "";
    lockDateFormat = "";
    greeterRememberLastSession = true;
    greeterRememberLastUser = true;
    greeterAutoLogin = false;
    greeterEnableFprint = false;
    greeterEnableU2f = false;
    greeterWallpaperPath = "";
    greeterLockDateFormat = "";
    greeterFontFamily = "";
    greeterWallpaperFillMode = "";
    greeterPamExternallyManaged = false;
    greeterSyncPending = false;
    greeterSyncBaseline = {};
    mediaSize = 1;
    appLauncherViewMode = "list";
    spotlightModalViewMode = "list";
    browserPickerViewMode = "grid";
    browserUsageHistory = {};
    appPickerViewMode = "grid";
    filePickerUsageHistory = {};
    sortAppsAlphabetically = false;
    appLauncherGridColumns = 4;
    spotlightCloseNiriOverview = true;
    rememberLastQuery = false;
    rememberLastMode = true;
    spotlightSectionViewModes = {};
    appDrawerSectionViewModes = {
      apps = "list";
    };
    niriOverviewOverlayEnabled = true;
    niriOverviewLauncherStyle = "full";
    dankLauncherV2Size = "compact";
    dankLauncherV2ShowSourceBadges = true;
    dankLauncherV2BorderEnabled = false;
    dankLauncherV2BorderThickness = 2;
    dankLauncherV2BorderColor = "primary";
    dankLauncherV2ShowFooter = true;
    dankLauncherV2UnloadOnClose = false;
    dankLauncherV2IncludeFilesInAll = false;
    dankLauncherV2IncludeFoldersInAll = false;
    launcherUseOverlayLayer = false;
    launcherStyle = "full";
    spotlightBarShowModeChips = false;
    keybindsFloatingWindow = false;
    useAutoLocation = false;
    weatherEnabled = true;
    dashTabs = [
      {
        id = "overview";
        enabled = true;
      }
      {
        id = "media";
        enabled = true;
      }
      {
        id = "wallpaper";
        enabled = true;
      }
      {
        id = "weather";
        enabled = true;
      }
      {
        id = "settings";
        enabled = true;
      }
    ];
    networkPreference = "wifi";
    iconThemeDark = "System Default";
    iconThemeLight = "System Default";
    iconThemePerMode = false;
    lastAppliedIconTheme = "";
    cursorSettings = {
      theme = "System Default";
      size = 19;
      niri = {
        hideWhenTyping = false;
        hideAfterInactiveMs = 0;
      };
      hyprland = {
        hideOnKeyPress = false;
        hideOnTouch = false;
        inactiveTimeout = 0;
      };
      dwl = {
        cursorHideTimeout = 0;
      };
    };
    launcherLogoMode = "os";
    launcherLogoCustomPath = "/etc/nixos/fmab/icons/light.svg";
    launcherLogoColorOverride = "";
    launcherLogoColorInvertOnMode = false;
    launcherLogoBrightness = 0.5;
    launcherLogoContrast = 1;
    launcherLogoSizeOffset = 1;
    fontFamily = "Inter Variable";
    monoFontFamily = "Fira Code";
    fontWeight = 400;
    fontScale = 1;
    textRenderType = 0;
    textRenderQuality = 0;
    notepadUseMonospace = true;
    notepadFontFamily = "";
    notepadFontSize = 14;
    notificationSummaryFontSize = 0;
    notificationBodyFontSize = 0;
    notepadShowLineNumbers = false;
    notepadAutoSave = false;
    notepadSlideoutSide = "right";
    notepadDefaultMode = "slideout";
    notepadTransparencyOverride = -1;
    notepadLastCustomTransparency = 0.7;
    notepadUseCompositorGap = false;
    notepadEdgeGap = 0;
    soundsEnabled = true;
    useSystemSoundTheme = false;
    soundLogin = false;
    soundNewNotification = true;
    soundVolumeChanged = true;
    soundPluggedIn = true;
    muteSoundsWhenMediaPlaying = true;
    acMonitorTimeout = 0;
    acLockTimeout = 0;
    acSuspendTimeout = 0;
    acSuspendBehavior = 0;
    acProfileName = "";
    acPostLockMonitorTimeout = 0;
    batteryMonitorTimeout = 0;
    batteryLockTimeout = 0;
    batterySuspendTimeout = 0;
    batterySuspendBehavior = 0;
    batteryProfileName = "";
    batteryPostLockMonitorTimeout = 0;
    batteryChargeLimit = 100;
    batteryNotifyChargeLimit = false;
    batteryCriticalThreshold = 10;
    batteryNotifyCritical = true;
    batteryLowThreshold = 20;
    batteryNotifyLow = false;
    batteryChargeLimitNotificationType = 0;
    batteryLowNotificationType = 0;
    batteryCriticalNotificationType = 1;
    batteryAutoPowerSaver = false;
    lockBeforeSuspend = true;
    loginctlLockIntegration = true;
    fadeToLockEnabled = true;
    fadeToLockGracePeriod = 5;
    fadeToDpmsEnabled = true;
    fadeToDpmsGracePeriod = 5;
    launchPrefix = "";
    gtkThemingEnabled = false;
    qtThemingEnabled = false;
    syncModeWithPortal = true;
    terminalsAlwaysDark = false;
    muxType = "tmux";
    muxUseCustomCommand = false;
    muxCustomCommand = "";
    muxSessionFilter = "";
    runDmsMatugenTemplates = true;
    matugenTemplateGtk = true;
    matugenTemplateNiri = true;
    matugenTemplateHyprland = true;
    matugenTemplateMangowc = true;
    matugenTemplateQt5ct = true;
    matugenTemplateQt6ct = true;
    matugenTemplateFirefox = true;
    matugenTemplatePywalfox = true;
    matugenTemplateZenBrowser = true;
    matugenTemplateVesktop = true;
    matugenTemplateVencord = true;
    matugenTemplateEquibop = true;
    matugenTemplateGhostty = true;
    matugenTemplateKitty = true;
    matugenTemplateFoot = true;
    matugenTemplateAlacritty = true;
    matugenTemplateNeovim = false;
    matugenTemplateWezterm = true;
    matugenTemplateDgop = true;
    matugenTemplateKcolorscheme = true;
    matugenTemplateVscode = true;
    matugenTemplateEmacs = true;
    matugenTemplateZed = true;
    matugenTemplateNeovimSettings = {
      dark = {
        baseTheme = "github_dark";
        harmony = 0.5;
      };
      light = {
        baseTheme = "github_light";
        harmony = 0.5;
      };
    };
    matugenTemplateNeovimSetBackground = true;
    showDock = false;
    dockAutoHide = false;
    dockSmartAutoHide = false;
    dockUseOverlayLayer = false;
    dockGroupByApp = false;
    dockRestoreSpecialWorkspaceOnClick = false;
    dockOpenOnOverview = true;
    dockPosition = 2;
    dockSpacing = 4;
    dockBottomGap = 0;
    dockMargin = 0;
    dockIconSize = 40;
    dockIndicatorStyle = "circle";
    dockBorderEnabled = false;
    dockBorderColor = "surfaceText";
    dockBorderOpacity = 1;
    dockBorderThickness = 1;
    dockIsolateDisplays = false;
    dockLauncherEnabled = false;
    dockLauncherLogoMode = "apps";
    dockLauncherLogoCustomPath = "";
    dockLauncherLogoColorOverride = "";
    dockLauncherLogoSizeOffset = 0;
    dockLauncherLogoBrightness = 0.5;
    dockLauncherLogoContrast = 1;
    dockMaxVisibleApps = 0;
    dockMaxVisibleRunningApps = 0;
    dockShowOverflowBadge = true;
    dockShowTrash = false;
    dockTrashFileManager = "default";
    dockTrashCustomCommand = "";
    notificationOverlayEnabled = false;
    notificationPopupShadowEnabled = true;
    notificationPopupPrivacyMode = false;
    notificationForegroundLayers = true;
    modalDarkenBackground = true;
    lockScreenShowPowerActions = true;
    lockScreenShowSystemIcons = true;
    lockScreenShowTime = true;
    lockScreenShowDate = true;
    lockScreenShowProfileImage = true;
    lockScreenShowPasswordField = false;
    lockScreenShowMediaPlayer = true;
    lockScreenPowerOffMonitorsOnLock = false;
    lockAtStartup = true;
    enableFprint = false;
    maxFprintTries = 15;
    enableU2f = false;
    u2fMode = "or";
    lockPamPath = "";
    lockPamInlineFprint = false;
    lockPamInlineU2f = false;
    lockPamExternallyManaged = false;
    lockU2fPamPath = "";
    lockScreenInactiveColor = "#000000";
    lockScreenNotificationMode = 0;
    lockScreenVideoEnabled = false;
    lockScreenVideoPath = "";
    lockScreenVideoCycling = false;
    lockScreenWallpaperPath = "";
    lockScreenWallpaperFillMode = "";
    lockScreenFontFamily = "";
    hideBrightnessSlider = false;
    notificationTimeoutLow = 5000;
    notificationTimeoutNormal = 5000;
    notificationTimeoutCritical = 0;
    notificationCompactMode = false;
    notificationShowTimeoutBar = false;
    notificationDedupeEnabled = true;
    notificationPopupPosition = 0;
    notificationAnimationSpeed = 1;
    notificationCustomAnimationDuration = 400;
    notificationHistoryEnabled = true;
    notificationHistoryMaxCount = 50;
    notificationHistoryMaxAgeDays = 7;
    notificationHistorySaveLow = true;
    notificationHistorySaveNormal = true;
    notificationHistorySaveCritical = true;
    notificationRules = [];
    notificationFocusedMonitor = false;
    osdAlwaysShowValue = false;
    osdPosition = 5;
    osdVolumeEnabled = true;
    osdMediaVolumeEnabled = true;
    osdMediaPlaybackEnabled = false;
    osdBrightnessEnabled = true;
    osdIdleInhibitorEnabled = true;
    osdMicMuteEnabled = true;
    osdCapsLockEnabled = true;
    osdPowerProfileEnabled = true;
    osdAudioOutputEnabled = true;
    powerActionConfirm = true;
    powerActionHoldDuration = 0.5;
    powerMenuActions = [
      "reboot"
      "logout"
      "poweroff"
      "lock"
      "suspend"
      "restart"
      "hibernate"
    ];
    powerMenuDefaultAction = "logout";
    powerMenuGridLayout = false;
    customPowerActionLock = "";
    customPowerActionLogout = "";
    customPowerActionSuspend = "";
    customPowerActionHibernate = "";
    customPowerActionReboot = "";
    customPowerActionPowerOff = "";
    updaterHideWidget = false;
    updaterCheckOnStart = false;
    updaterUseCustomCommand = false;
    updaterCustomCommand = "";
    updaterTerminalAdditionalParams = "";
    updaterIntervalSeconds = 1800;
    updaterIncludeFlatpak = true;
    updaterAllowAUR = true;
    updaterIgnoredPackages = [];
    displayNameMode = "system";
    screenPreferences = {};
    showOnLastDisplay = {};
    niriOutputSettings = {};
    hyprlandOutputSettings = {};
    displayProfiles = {};
    activeDisplayProfile = {};
    displayProfileAutoSelect = false;
    displayShowDisconnected = false;
    displaySnapToEdge = true;
    connectedFrameBarStyleBackups = {};
    barConfigs = [
      {
        id = "default";
        name = "Main Bar";
        enabled = true;
        position = 0;
        screenPreferences = [
          "all"
        ];
        showOnLastDisplay = true;
        leftWidgets = [
          {
            id = "launcherButton";
            enabled = true;
          }
          {
            id = "workspaceSwitcher";
            enabled = true;
          }
          {
            id = "focusedWindow";
            enabled = true;
          }
        ];
        centerWidgets = [
          {
            id = "music";
            enabled = true;
          }
        ];
        rightWidgets = [
          {
            id = "systemTray";
            enabled = true;
          }
          {
            id = "notificationButton";
            enabled = true;
          }
          {
            id = "controlCenterButton";
            enabled = true;
          }
          {
            id = "keyboard_layout_name";
            enabled = true;
          }
          {
            id = "clock";
            enabled = true;
          }
          {
            id = "privacyIndicator";
            enabled = true;
          }
          {
            id = "capsLockIndicator";
            enabled = true;
          }
          {
            id = "powerMenuButton";
            enabled = true;
          }
        ];
        spacing = 4;
        innerPadding = 4;
        bottomGap = 0;
        transparency = 1;
        widgetTransparency = 1;
        squareCorners = false;
        noBackground = false;
        maximizeWidgetIcons = false;
        maximizeWidgetText = false;
        removeWidgetPadding = false;
        widgetPadding = 8;
        gothCornersEnabled = false;
        gothCornerRadiusOverride = false;
        gothCornerRadiusValue = 12;
        borderEnabled = false;
        borderColor = "surfaceText";
        borderOpacity = 1;
        borderThickness = 1;
        widgetOutlineEnabled = false;
        widgetOutlineColor = "primary";
        widgetOutlineOpacity = 1;
        widgetOutlineThickness = 1;
        fontScale = 1;
        iconScale = 1;
        autoHide = false;
        autoHideDelay = 250;
        showOnWindowsOpen = false;
        openOnOverview = false;
        visible = true;
        popupGapsAuto = true;
        popupGapsManual = 4;
        maximizeDetection = true;
        scrollEnabled = true;
        scrollXBehavior = "column";
        scrollYBehavior = "workspace";
        shadowIntensity = 0;
        shadowOpacity = 60;
        shadowColorMode = "text";
        shadowCustomColor = "#000000";
        clickThrough = false;
      }
    ];
    desktopClockEnabled = false;
    desktopClockStyle = "analog";
    desktopClockTransparency = 0.8;
    desktopClockColorMode = "primary";
    desktopClockCustomColor = {
      r = 1;
      g = 1;
      b = 1;
      a = 1;
      hsvHue = -1;
      hsvSaturation = 0;
      hsvValue = 1;
      hslHue = -1;
      hslSaturation = 0;
      hslLightness = 1;
      valid = true;
    };
    desktopClockShowDate = true;
    desktopClockShowAnalogNumbers = false;
    desktopClockShowAnalogSeconds = true;
    desktopClockX = -1;
    desktopClockY = -1;
    desktopClockWidth = 280;
    desktopClockHeight = 180;
    desktopClockDisplayPreferences = [
      "all"
    ];
    systemMonitorEnabled = false;
    systemMonitorShowHeader = true;
    systemMonitorTransparency = 0.8;
    systemMonitorColorMode = "primary";
    systemMonitorCustomColor = {
      r = 1;
      g = 1;
      b = 1;
      a = 1;
      hsvHue = -1;
      hsvSaturation = 0;
      hsvValue = 1;
      hslHue = -1;
      hslSaturation = 0;
      hslLightness = 1;
      valid = true;
    };
    systemMonitorShowCpu = true;
    systemMonitorShowCpuGraph = true;
    systemMonitorShowCpuTemp = true;
    systemMonitorShowGpuTemp = false;
    systemMonitorGpuPciId = "";
    systemMonitorShowMemory = true;
    systemMonitorShowMemoryGraph = true;
    systemMonitorShowNetwork = true;
    systemMonitorShowNetworkGraph = true;
    systemMonitorShowDisk = true;
    systemMonitorShowTopProcesses = false;
    systemMonitorTopProcessCount = 3;
    systemMonitorTopProcessSortBy = "cpu";
    systemMonitorGraphInterval = 60;
    systemMonitorLayoutMode = "auto";
    systemMonitorX = -1;
    systemMonitorY = -1;
    systemMonitorWidth = 320;
    systemMonitorHeight = 480;
    systemMonitorDisplayPreferences = [
      "all"
    ];
    systemMonitorVariants = [];
    desktopWidgetPositions = {};
    desktopWidgetGridSettings = {};
    desktopWidgetInstances = [];
    desktopWidgetGroups = [];
    builtInPluginSettings = {
      dms_settings_search = {
        trigger = "?";
      };
    };
    clipboardClickToPaste = false;
    clipboardEnterToPaste = true;
    clipboardRememberTypeFilter = false;
    clipboardTypeFilter = "all";
    clipboardVisibleEntryActions = [
      "pin"
      "edit"
      "delete"
    ];
    launcherPluginVisibility = {};
    launcherPluginOrder = [];
    frameEnabled = false;
    frameThickness = 16;
    frameRounding = 23;
    frameColor = "";
    frameOpacity = 1;
    frameScreenPreferences = [
      "all"
    ];
    frameBarSize = 40;
    frameShowOnOverview = false;
    frameBlurEnabled = true;
    frameCloseGaps = true;
    frameLauncherEmergeSide = "bottom";
    frameLauncherArcExtender = false;
    frameLauncherEdgeHover = false;
    frameMode = "connected";
    barInsetPaddingShared = -1;
    barInsetPaddingSyncAll = false;
    frameBarInsetPadding = -1;
    configVersion = 13;
  });
in
{
  xdg.configFile."niri/config.noctalia.kdl".source = ./niri-for-noctalia.kdl;
  xdg.configFile."niri/config.dms.kdl".source = ./niri-for-dms.kdl;
  programs.noctalia = {
    enable = true;
    systemd.enable = false;
    settings = {
      accessibility = {
        high_contrast = false;
        ui_scale = 1.0;
      };

      audio = {
        enable_overdrive = true;
        enable_sounds = false;
        sound_volume = 0.5;
      };

      backdrop = {
        blur_intensity = 0.4;
        enabled = true;
        tint_intensity = 0.6;
      };

      bar.main = {
        auto_hide = false;
        background_opacity = 0.75;
        capsule = true;
        capsule_opacity = 0.5;
        center = [
          "workspaces"
          "audio_visualizer"
        ];
        end = [
          "tray"
          "battery"
          "volume"
          "brightness"
          "network"
          "lock_keys"
          "keyboard_layout"
          "session"
          "theme_mode"
          "control-center"
        ];
        margin_edge = 4;
        margin_ends = 4;
        position = "top";
        radius = 12;
        start = [
          "launcher"
          "clock"
          "sysmon"
          "media"
          "taskbar"
        ];
        thickness = 34;
      };

      brightness.enable_ddcutil = false;

      calendar.enabled = true;

      control_center = {
        calendar = {
          show_events_card = true;
          show_week_numbers = false;
        };
        shortcuts = [
          { type = "bluetooth"; }
          { type = "wallpaper"; }
          { type = "notification"; }
          { type = "nightlight"; }
          { type = "wifi"; }
          { type = "session"; }
        ];
      };

      desktop_widgets = {
        schema_version = 2;
        widget_order = [ ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget = { };
      };

      dock = {
        auto_hide = true;
        background_opacity = 0.75;
        enabled = true;
        position = "bottom";
      };

      keybinds = {
        cancel = [ "escape" ];
        delete = [ "del" ];
        down = [ "down" ];
        left = [ "left" ];
        right = [ "right" ];
        up = [ "up" ];
        validate = [ "return" ];
      };

      location = {
        auto_locate = false;
        latitude = 35.43;
        longitude = 51.24;
      };

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [ "lockscreen-login-box@eDP-1" ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget."lockscreen-login-box@eDP-1" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 768.0;
          cy = 682.0;
          output = "eDP-1";
          placement_height = 864.0;
          placement_width = 1536.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
      };

      nightlight = {
        enabled = false;
        force = false;
        temperature_day = 6500;
        temperature_night = 4000;
      };

      notification = {
        background_opacity = 1.0;
        enable_daemon = true;
        layer = "overlay";
      };

      osd = {
        background_opacity = 1.0;
        position = "top_right";
      };

      shell = {
        avatar_path = "/home/ali/.face.icon";
        clipboard_auto_paste = "off";
        clipboard_enabled = true;
        corner_radius_scale = 1.0;
        date_format = "%A, %x";
        font_family = "sans-serif";
        telemetry_enabled = true;
        time_format = "{:%H:%M}";

        animation = {
          enabled = true;
          speed = 1.0;
        };

        launcher = {
          app_grid = false;
          auto_paste = "off";
          categories = true;
          compact = false;
          pinned = [ ];
          show_icons = true;
          sort_by_usage = true;
          providers = {
            session = {
              global = true;
              prefix = "session";
            };
            windows = {
              global = true;
              prefix = "win";
            };
          };
        };

        mpris.blacklist = [ ];

        panel = {
          borders = true;
          control_center_placement = "attached";
          launcher_placement = "floating";
          launcher_position = "top_left";
          open_near_click_control_center = true;
          session_placement = "floating";
          session_position = "center";
          shadow = true;
          transparency_mode = "soft";
        };

        shadow = {
          alpha = 0.55;
          direction = "down_right";
        };
      };

      system.monitor.enabled = true;

      theme = {
        builtin = "Catppuccin";
        mode = "auto";
        source = "builtin";
      };

      wallpaper = {
        directory = "/home/ali/Pictures/Wallpapers";
        edge_smoothness = 0.05;
        enabled = true;
        fill_color = "#000000";
        fill_mode = "crop";
        transition = [
          "fade"
          "wipe"
          "disc"
          "stripes"
          "zoom"
          "honeycomb"
        ];
        transition_duration = 1500;
        transition_on_startup = true;

        automation = {
          enabled = false;
          interval_seconds = 300;
          order = "random";
        };

        default.path = "/home/ali/Pictures/Wallpapers/5.png";
        last.path = "/home/ali/Pictures/Wallpapers/5.png";
        monitors.eDP-1.path = "/home/ali/Pictures/Wallpapers/5.png";
      };

      weather = {
        effects = true;
        enabled = true;
        unit = "celsius";
      };

      widget = {
        clock = {
          format = "{:%H:%M %a, %b %d}";
          tooltip_format = "{:%H:%M %a, %b %d}";
          vertical_format = "{:%H %M - %d %m}";
        };
        keyboard_layout.show_glyph = true;
      };
    };
  };
  home.activation.dmsSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target="${config.xdg.configHome}/DankMaterialShell/settings.json"
    if [ ! -e "$target" ]; then
      install -D --mode=644 --owner=${config.home.username} --group=users ${dmsConfig} "$target"
    fi
  '';
}
