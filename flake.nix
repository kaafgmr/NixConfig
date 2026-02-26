{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { nixpkgs, nixvim, ... }:
    {
        nixosConfigurations = {
            default = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    inherit nixpkgs nixvim;
                };
                modules = [
                    ./configuration.nix
                    ./machines/desktop/hardware-configuration.nix
                    ./gpu/Desktop.nix
                ];
            };

            laptop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    inherit nixpkgs nixvim;
                };
                modules = [
                    ./configuration.nix
                    ./machines/laptop/hardware-configuration.nix
                    ./gpu/laptop.nix
                ];
            };
        };
    };
}
