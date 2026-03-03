{  ... }:
{
    programs = {
        appimage = {
            enable = true;
            binfmt = true;
        };

        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
            protontricks.enable = true;
        };
    };

    hardware.steam-hardware.enable = true;
}
