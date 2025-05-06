{  pkgs, ... }:
{
    environment = {
        systemPackages = with pkgs; [
            (python3.withPackages (python-pkgs: with python-pkgs; [
                virtualenv
                pip
                yt-dlp
            ]))

            (opencv.override { enableGtk3 = true; })

            git
            ffmpeg-full
        ];
    };
}
