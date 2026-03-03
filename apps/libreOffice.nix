{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [ 
        libreoffice-qt-still
        hunspell
        hunspellDicts.en-us-large
        hunspellDicts.es-es
    ];
}
