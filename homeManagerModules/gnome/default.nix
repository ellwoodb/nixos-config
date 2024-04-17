{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
        "org.gnome.TextEditor.desktop"
        "code.desktop"
        "cider.desktop"
        "steam.desktop"
        "PrusaSlicer.desktop"
        "org.gnome.Settings.desktop"
      ];
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "caffeine@patapon.info"
        "tailscale@joaophi.github.com"
        "just-perfection-desktop@just-perfection"
      ];
    };
  };
  home.packages = with pkgs; [
    # Extensions
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tailscale-qs
    gnomeExtensions.removable-drive-menu
    gnomeExtensions.just-perfection
  ];

}
