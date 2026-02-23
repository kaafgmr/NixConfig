{ pkgs, ... }:
{
    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                rocmPackages.clr.icd
            ];

        };
    };

    nixpkgs.config.nvidia.acceptLicense = true;

    services = {
        xserver = {
            videoDrivers = [
                "amdgpu"
            ];
        };
    };
}
