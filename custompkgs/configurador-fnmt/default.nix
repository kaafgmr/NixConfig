{ pkgs, ... }:

let
    configuradorFnmt = pkgs.stdenv.mkDerivation {
        pname = "configurador-fnmt";
        version = "4.0.6";

        src = ./configuradorfnmt-4.0.6-0.x86_64.rpm;

        nativeBuildInputs = [ pkgs.rpmextract ];
        buildInputs = [ pkgs.bash pkgs.firefox ];

        unpackPhase = ''
            rpmextract $src
        '';

        installPhase = ''
            mkdir -p $out/bin
            mkdir -p $out/share/applications

            cp -r ./* $out/

            rm -rf $out/usr/lib64/configuradorfnmt/jre
            ln -s ${pkgs.jdk17} $out/usr/lib64/configuradorfnmt/jre

            substituteInPlace $out/usr/bin/configuradorfnmt \
              --replace /usr/lib64/configuradorfnmt $out/usr/lib64/configuradorfnmt

            ln -s $out/usr/bin/configuradorfnmt $out/bin/configuradorfnmt

            cp usr/share/applications/configuradorfnmt.desktop $out/share/applications/

            chmod -R +x $out/usr/bin/* || true
        '';

        meta = {
            description = "Configurador FNMT-RCM for Linux 64bits";
            platforms = [ "x86_64-linux" ];
        };
    };
in
{
    environment.systemPackages = with pkgs; [
        firefox
        bash
        configuradorFnmt
    ];
}
