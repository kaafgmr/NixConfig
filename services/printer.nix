{ pkgs, ... }:
{
    hardware = {
        sane = {
            enable = true;
            extraBackends = with pkgs; [
                hplipWithPlugin
            ];
        };

        printers = {
            ensurePrinters = [
                {
                    name = "DummyPrinter";
                    location = "DummyHome";
                    deviceUri = "file:/tmp/wine_dummy_printer";
                    model = "drv:///sample.drv/generic.ppd";
                    ppdOptions.PageSize = "A4";
                }
            ];
        };
    };

    services = {
        printing = {
            enable = true;
            extraFilesConf = ''
                FileDevice Yes
            '';
        };

        avahi = {
            enable = true;
            nssmdns4 = true;
            openFirewall = true;
        };
    };

}
