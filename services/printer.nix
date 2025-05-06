{ pkgs, ... }:
{
    hardware = {
        sane = {
            enable = true;
            extraBackends = with pkgs; [
                hplipWithPlugin
            ];
        };
    };

    services = {
        printing.enable = true;

        avahi = {
            enable = true;
            nssmdns4 = true;
            openFirewall = true;
        };
    };

}
