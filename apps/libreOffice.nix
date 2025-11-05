{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [ 
        libreoffice-qt
        hunspell
        hunspellDicts.en-us-large
        hunspellDicts.es-es
    ];
}
