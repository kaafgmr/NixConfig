{  pkgs, ... }:
{
    programs = {
        hyprland.enable = true;
        waybar.enable = true;
    };
    
    services = {
        # Enable the KDE Plasma Desktop Environment.
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;

    };

    #Make default apps work with hyprland
    xdg.portal = {
        enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-hyprland
        ];
    };

    environment = {
        systemPackages = with pkgs; [
            kitty
            wofi
            hyprpaper
            pavucontrol
            qt6.qttools
            hyprshot
            mimeo
        ];

        sessionVariables = {
            NIXOS_OZONE_WL = "1";
        };
    };
}
