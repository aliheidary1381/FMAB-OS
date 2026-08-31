{ pkgs }:
pkgs.runCommand "fmab-customizations" { } ''
    mkdir -p $out/share/
    cp -r ${../proprietary/fmab}/* $out/share/
    chmod -R u+rwX $out
    cp -r ${../fmab}/* $out/share/
    chmod -R u+rwX $out

    cp -Lr ${pkgs.kdePackages.breeze-icons}/share/icons/breeze $out/share/icons/fmab
    cp -Lr ${pkgs.kdePackages.breeze-icons}/share/icons/breeze-dark $out/share/icons/fmab-dark
    cp -Lr ${pkgs.kdePackages.plasma-workspace}/share/plasma/look-and-feel/org.kde.breeze.desktop/contents/logout  $out/share/plasma/look-and-feel/fmab.light.desktop/contents
    cp -Lr ${pkgs.kdePackages.plasma-workspace}/share/plasma/look-and-feel/org.kde.breeze.desktop/contents/layouts $out/share/plasma/look-and-feel/fmab.light.desktop/contents
    cp -Lr ${pkgs.kdePackages.plasma-workspace}/share/plasma/look-and-feel/org.kde.breezedark.desktop/contents/layouts $out/share/plasma/look-and-feel/fmab.dark.desktop/contents
    chmod -R u+rwX $out
    find $out/share/icons/fmab/places -name "start-here*" -exec cp $out/share/icons/light.svg {} \;
    find $out/share/icons/fmab-dark/places -name "start-here*" -exec cp $out/share/icons/dark.svg {} \;

    for theme in fmab.frappe fmab.latte; do
      theme_dir="$out/share/plymouth/themes/$theme"
      install -Dm644 ${pkgs.kdePackages.breeze-plymouth}/share/plymouth/themes/breeze/breeze.script "$theme_dir/$theme.script"
      patch "$theme_dir/$theme.script" < "$theme_dir/script.patch"
      rm "$theme_dir/script.patch"
      sed -i "s|ImageDir=.*|ImageDir=$theme_dir|" "$theme_dir/$theme.plymouth"
      sed -i "s|ScriptFile=.*|ScriptFile=$theme_dir/$theme.script|" "$theme_dir/$theme.plymouth"
    done

    for theme in fmab.light.desktop fmab.dark.desktop; do
        theme_dir="$out/share/plasma/look-and-feel/$theme/contents/splash/"
        install -Dm644 ${pkgs.kdePackages.plasma-workspace}/share/plasma/look-and-feel/org.kde.breeze.desktop/contents/splash/Splash.qml "$theme_dir/Splash.qml"
        patch "$theme_dir/Splash.qml" < "$theme_dir/splash.patch"
        rm "$theme_dir/splash.patch"
    done

    install -Dm644 "${pkgs.catppuccin-kde.override{flavour = [ "latte" ];accents = [ "yellow" ];}}/share/color-schemes/CatppuccinLatteYellow.colors" "$out/share/color-schemes/CatppuccinLatteYellow.colors"
    install -Dm644 "${pkgs.catppuccin-kde.override{flavour = [ "frappe" ];accents = [ "yellow" ];}}/share/color-schemes/CatppuccinFrappeYellow.colors" "$out/share/color-schemes/CatppuccinFrappeYellow.colors"
''
# TODO: use https://github.com/catppuccin/chrome/tree/main/themes/latte/yellow and https://github.com/catppuccin/chrome/tree/main/themes/frappe/yellow
