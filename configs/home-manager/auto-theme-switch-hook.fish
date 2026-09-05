#!/usr/bin/env fish

function sync_theme
    set -l base_gen (ls -vd ~/.local/state/nix/profiles/home-manager-*-link/specialisation | tail -n 1 | sed 's|/specialisation||')

    # Get the current preference (1=Dark, 2=Light)
    set val (dbus-send --session --print-reply=literal \
        --dest=org.freedesktop.portal.Desktop \
        /org/freedesktop/portal/desktop \
        org.freedesktop.portal.Settings.Read \
        string:'org.freedesktop.appearance' string:'color-scheme' | awk '{print $NF}')

    if test "$val" = "2"
        echo "KDE reports Light Mode. Switching..."
        rm -f /home/ali/.config/okularpartrc
        install --mode=644 --owner=ali --group=users /home/ali/.config/okularpartrc-frappe /home/ali/.config/okularpartrc
        eval "$base_gen/specialisation/light/activate"
    else if test "$val" = "1"
        echo "KDE reports Dark Mode. Switching..."
        rm -f /home/ali/.config/okularpartrc
        install --mode=644 --owner=ali --group=users /home/ali/.config/okularpartrc-latte /home/ali/.config/okularpartrc
        eval "$base_gen/specialisation/dark/activate"
    else
        echo "KDE reports No Preference. Switching..."
        eval "$base_gen/activate"
    end
end

# Run once on service start to match current KDE state
sync_theme

# Listen for the SettingChanged signal from the XDG Portal
dbus-monitor "type='signal',interface='org.freedesktop.portal.Settings',member='SettingChanged'" | while read line
    if string match -q "*color-scheme*" "$line"
        sync_theme
        sed -i '/^gtk-application-prefer-dark-theme/d' ~/.config/gtk-4.0/settings.ini
    end
end
