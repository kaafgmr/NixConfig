{  pkgs, config, ... }:
{
    environment = {
        systemPackages = [
            (pkgs.wrapOBS {
                plugins = with pkgs.obs-studio-plugins; [
                    wlrobs
                    obs-pipewire-audio-capture
                    obs-websocket
                    obs-shaderfilter
                ];
            })
        ];

        variables = {
            OBS_USE_EGL = "1";
        };
    };

    boot = {
        extraModulePackages = with config.boot.kernelPackages; [
            v4l2loopback
        ];

        extraModprobeConfig = ''options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1'';
    };
    
    security.polkit.enable = true;
}
