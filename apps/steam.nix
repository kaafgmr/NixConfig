{  pkgs, ... }:
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
            package = pkgs.steam.override {
                extraPkgs = pkgs: [
                    pkgs.bumblebee
                    pkgs.glxinfo
                ];
            };
        };
    };
}
