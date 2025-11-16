{  pkgs, ... }:
{
    /*nixpkgs.overlays = [
       (final: prev: {
           orca-slicer = prev.orca-slicer.overrideAttrs (old: {
               desktopItems = (old.desktopItems or []) ++ [
                    (prev.makeDesktopItem {
                        name = "orca-slicer";
                        desktopName = "Orca Slicer";
                        comment = "(overritten)";
                        exec = "env __GLX_VENDOR_LIBRARY_NAME=mesa __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink WEBKIT_DISABLE_DMABUF_RENDERER=1 orca-slicer";
                        icon = old.icon or "orca-slicer";
                        terminal = false;
                    })
                ];
            });
      })

    ];*/

    environment.systemPackages = with pkgs; [ 
        orca-slicer
    ];
}
