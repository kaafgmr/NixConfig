{ /*pkgs, */unstable,  ... }:
{
    /*the docs says to use steam-run to run exported projects (I'm not adding steam to this config
     since I have steam on my pc already and I don't want to add steam to the godot installation
     script LOL) */
    users.users.kaaf = {

        packages = with unstable; [
            godot_4-mono
        ];
    };

   /* android stuff
   nixpkgs.config.android_sdk.accept_license = true;

   environment.systemPackages = with pkgs; [
       android-tools
       androidenv.androidPkgs.androidsdk
       androidenv.androidPkgs.emulator
       androidenv.androidPkgs.ndk-bundle
       jdk
   ];*/
}
