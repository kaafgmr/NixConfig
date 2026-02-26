{  pkgs, ... }:
{
    programs = {
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
        waybar.enable = true;
    };
    
    services = {
        # Enable the KDE Plasma Desktop Environment.
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;

    };

    #Make default apps work with hyprland
    xdg = {
        mime = {
            enable = true;
        };

        portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-hyprland
            ];
        };
    };

    environment = {
        systemPackages = with pkgs; [
            kitty
            rofi
            hyprpaper
            pavucontrol
            qt6.qttools
            hyprshot
            mimeo
            brightnessctl
            playerctl
            networkmanager_dmenu
        ];

        sessionVariables = {
            NIXOS_OZONE_WL = "1";
        };
    };
}
