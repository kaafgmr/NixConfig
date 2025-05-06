{ pkgs, fetchurl, stdenv, lib, ... }:
let
    version = "4.0.6-0";
in
stdenv.mkDerivation {
    pname = "configurador-fnmt";

    src = fetchurl {
        url = "https://descargas.cert.fnmt.es/Linux/configuradorfnmt-${version}.x86_64.rpm";
        sha256 = lib.fakeSha256;
    };

    nativeBuildInputs = [ pkgs.rpmextract ];
    buildInputs = [ pkgs.bash pkgs.firefox ];

    unpackPhase = ''
        rpmextract $src
    '';

    installPhase = ''
        mkdir -p $out/bin
        mkdir -p $out/share/applications

        cp -r ./* $out/

        # replace jre so the app opens
        rm -rf $out/usr/lib64/configuradorfnmt/jre
        ln -s ${pkgs.jdk17} $out/usr/lib64/configuradorfnmt/jre

        substituteInPlace $out/usr/bin/configuradorfnmt \
          --replace /usr/lib64/configuradorfnmt $out/usr/lib64/configuradorfnmt

        ln -s $out/usr/bin/configuradorfnmt $out/bin/configuradorfnmt

        cp usr/share/applications/configuradorfnmt.desktop $out/share/applications/

        chmod -R +x $out/usr/bin/*
    '';

    meta = with lib; {
        description = "Spanish Digital Certificate configurator app";
        homepage = "https://www.sede.fnmt.gob.es/descargas/descarga-software/instalacion-software-generacion-de-claves";
        mainProgram = "configuradorfnmt";
        license = licenses.unfree;
        platforms = [ "x86_64-linux" ];
    };
}
