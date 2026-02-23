{ config, ... }:
{
    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
        };
    };

    services = {
        xserver = {
            enable = true;
            videoDrivers = [
                "amdgpu"
                "nvidia"
            ];
        };
    };

    nixpkgs.config = {
        allowUnfree = true;
        nvidia.acceptLicense = true;
    };


    hardware.nvidia = {
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;

        prime = {
            offload = {
                enable = true;
                enableOffloadCmd = true;
            };

            amdgpuBusId = "PCI:1:0:0";
            nvidiaBusId = "PCI:4:0:0";
        };
    };
}
