{  pkgs, config, lib, ... }:
{
    imports = [ 
        # Include the results of the hardware scan.
        ./hardware-configuration.nix

        # Include services and their dependencies
        ./services/default.nix

        # Adds some apps/frameworks for programing (I don't like nixenv (for now LOL))
        ./programing/utils.nix

    	# Include apps that require configuration
	    ./apps/default.nix


        # Set up the desktop environment
        ./desktopEnv/DE.nix
    ];

    boot = {
        loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot.enable = true;
        };

        kernelModules = [ "usbcore" "usbhid" ];
    };

    nix.settings = {
        experimental-features = [ "nix-command" "flakes"];
        auto-optimise-store = true;
    };

    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
        
        firewall.allowedTCPPorts = [ 22 ];
    };

    time.timeZone = "Europe/Madrid";

    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
            LC_ADDRESS = "es_ES.UTF-8";
            LC_IDENTIFICATION = "es_ES.UTF-8";
            LC_MEASUREMENT = "es_ES.UTF-8";
            LC_MONETARY = "es_ES.UTF-8";
            LC_NAME = "es_ES.UTF-8";
            LC_NUMERIC = "es_ES.UTF-8";
            LC_PAPER = "es_ES.UTF-8";
            LC_TELEPHONE = "es_ES.UTF-8";
            LC_TIME = "es_ES.UTF-8";
        };
    };

    services = {
        # Enable the X11 windowing system.
        # You can disable this if you're only using the Wayland session.
        xserver = {
            enable = true;
            videoDrivers = [ "nvidia" ];

            # Configure keymap in X11
            xkb = {
                layout = "latam, es";
                variant = "";
                options = "grp:win_space_toggle";
            };
        };

        openssh.enable = true;

        udev.enable = true;
    };

    security = {

        sudo = {
            extraRules = [
                {
                    users = [ "kaaf" ];
                    commands = [ { command = "ALL"; options = [ "SETENV" ]; } ];
                }
            ];

            extraConfig = '' Defaults env_keep += "XDG_RUNTIME_DIR WAYLAND_DISPLAY" '';
        };
    };

    console.keyMap = "la-latin1";


    hardware = {
        # Enable dedicated Nvidia gpu support
        graphics.enable = true;
        
        nvidia = {
            modesetting.enable = true;
            open = true;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.production;
            /*package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
                version = "580.76.05";
                sha256_64bit = "sha256-IZvmNrYJMbAhsujB4O/4hzY8cx+KlAyqh7zAVNBdl/0=";
                sha256_aarch64 = "sha256-IZvmNrYJMbAhsujB4O/4hzY8cx+KlAyqh7zAVNBdl/0=";
                openSha256 = "sha256-xEPJ9nskN1kISnSbfBigVaO6Mw03wyHebqQOQmUg/eQ=";
                settingsSha256 = "sha256-ll7HD7dVPHKUyp5+zvLeNqAb6hCpxfwuSyi+SAXapoQ=";
                persistencedSha256 = lib.fakeSha256;
            };*/
        };

        openrazer.enable = true;

        keyboard.qmk.enable = true;
    };

    users.users.kaaf = {
        isNormalUser = true;
        description = "Kelson Alan Alberti Filho";
        extraGroups = [ "networkmanager" "wheel" "openrazer" "render" "scanner" "lp" "dialout" ];
        packages = with pkgs; [
            keepassxc
            polychromatic
            youtube-music
            discord
            ripgrep
            anki-bin
            orca-slicer
            gimp
            fastfetch
            unzip
            popsicle
            exfat
            kdePackages.kcalc
            kdePackages.kolourpaint
            kdePackages.skanpage
            kdePackages.okular
            signal-desktop
            strawberry-qt6
            obsidian
            blender
            qmk
        ];
    };

    programs = {
        firefox.enable = true;
    };

    fonts.packages = [ ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

    nixpkgs.config = {
        allowUnfree = true;
        nvidia.acceptLicense = true;
    };

    environment = {
        systemPackages = with pkgs; [
            (callPackage ./custompkgs/configurador-fnmt/default.nix {
                inherit (pkgs) fetchurl stdenv lib;
            })
            kicad
            unrar
            arduino-ide
            tree
            freecad
            anydesk
            usbutils
            openrazer-daemon
            btop-cuda
            vlc
            nextcloud-client
            gtk2
            gtk3
            pkg-config
            winetricks
            wineWowPackages.waylandFull
            cameractrls-gtk4
            davinci-resolve-studio
        ];
        
        plasma6.excludePackages =  with pkgs.kdePackages; [
            elisa
            spectacle
        ];
    };

    system = {
        autoUpgrade.enable = true;
        autoUpgrade.allowReboot = true;

        # This value determines the NixOS release from which the default
        # settings for stateful data, like file locations and database versions
        # on your system were taken. It‘s perfectly fine and recommended to leave
        # this value at the release version of the first install of this system.
        # Before changing this value read the documentation for this option
        # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        stateVersion = "24.11";
    };
}
