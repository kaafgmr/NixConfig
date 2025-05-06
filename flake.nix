{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

        nixpkgsUnstable.url = "github:nixos/nixpkgs/nixos-unstable";

        nixvim = {
            url = "github:nix-community/nixvim/nixos-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { nixpkgs, nixpkgsUnstable, nixvim, ... }:
    let
        system = "x86_64-linux";

        pkgsUnstable = import nixpkgsUnstable {
            inherit system;
            config.allowUnfree = true;
        };
    in
    {
        nixosConfigurations = {
            default = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    inherit nixpkgs nixpkgsUnstable nixvim;
                    unstable = pkgsUnstable;
                };
                modules = [
                    ./configuration.nix
                ];
            };
        };
    };
}
