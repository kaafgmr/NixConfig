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

    environment = {
        systemPackages = with pkgs; [
            kitty
            wofi
            hyprpaper
            pavucontrol
            qt6.qttools
        ];

        sessionVariables = {
            NIXOS_OZONE_WL = "1";
        };
    };
}
