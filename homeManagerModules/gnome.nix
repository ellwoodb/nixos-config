{ config, pkgs, lib, ... }:

{
  options = {
    gnome-conf.enable =
      lib.mkEnableOption "enables Gnome config";
  };

  config = lib.mkIf config.gnome-conf.enable {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/shell" = {
        favorite-apps = [
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
          "vesktop.desktop"
          "org.gnome.Console.desktop"
          "org.gnome.TextEditor.desktop"
          "code.desktop"
          "cider.desktop"
          "steam.desktop"
          "org.prismlauncher.PrismLauncher.desktop"
          "OrcaSlicer.desktop"
          "org.gnome.SystemwwMonitor.desktop"
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
          "tilingshell@ferrarodomenico.com"
          "hass-gshell@geoph9-on-github"
          "clipboard-indicator@tudmotu.com"
        ];
      };
      "org/gnome/shell/extensions/just-perfection" = {
        dash-icon-size = 52;
      };
      "org/gnome/shell/keybindings" = {
        show-screenshot-ui = "['<Shift><Super>s']";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/matthias/.dotfiles/wallpapers/desert.jpg";
        picture-uri-dark = "file:///home/matthias/.dotfiles/wallpapers/desert.jpg";
      };
    };
    home.packages = with pkgs.gnomeExtensions; [
      # Extensions
      appindicator
      caffeine
      blur-my-shell
      tailscale-qs
      removable-drive-menu
      just-perfection
      tiling-shell
      home-assistant-extension
      clipboard-indicator
    ];
    gtk = {
      enable = true;

      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };

      iconTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };

      cursorTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };

      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };

      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };

    };
  };
}
