{  pkgs, unstable,  ... }:
{
    programs = {
        obs-studio = {
            enable = true;
            enableVirtualCamera = true;

            plugins = [
                pkgs.obs-studio-plugins.obs-pipewire-audio-capture
                pkgs.obs-studio-plugins.obs-websocket
                unstable.obs-studio-plugins.obs-shaderfilter
            ];
        };

    };

    environment = {
        variables = {
            OBS_USE_EGL = "1";
        };
    };
}
