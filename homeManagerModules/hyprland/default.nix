{ inputs, config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    systemd.variables = [ "--all" ];

    settings = {
      input = {
        kb_layout = "de";
        kb_variant = "nodeadkeys";
        sensitivity = 1.0;
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        first_launch_animation = true;

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
        mfact = "0.5";
      };

      # Issue due to Hyprland (v0.40.0) and Nvidia-Drivers
      monitor = [
        "DP-4, 3440x1440@165, 0x0, 1"
        "HDMI-A-2, 1920x1080@60, 3440x720, 1"
      ];

      keybindings =
        let
          mainMod = "SUPER";
          workspaces = [ 1 2 3 4 5 6 7 8 9 ];
        in
        {
          bind = [
            "${mainMod}, Q, exec, ${pkgs.alacritty}/bin/alacritty"
            "${mainMod}, W, killactive,"
            "${mainMod}, M, exit,"
            "${mainMod}, E, exec, ${pkgs.gnome.nautilus}/bin/nautilus"
            "${mainMod}, V, togglefloating,"
            "${mainMod}, SPACE, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun"
            "${mainMod}, P, pseudo," # dwindle
            "${mainMod}, J, togglesplit," # dwindle

            # Move focus with mainMod + arrow keys
            "${mainMod}, left, movefocus, l"
            "${mainMod}, right, movefocus, r"
            "${mainMod}, up, movefocus, u"
            "${mainMod}, down, movefocus, d"

            # Switch workspaces with mainMod + [0-9]
            "${mainMod}, 1, workspace, 1"
            "${mainMod}, 2, workspace, 2"
            "${mainMod}, 3, workspace, 3"
            "${mainMod}, 4, workspace, 4"
            "${mainMod}, 5, workspace, 5"
            "${mainMod}, 6, workspace, 6"
            "${mainMod}, 7, workspace, 7"
            "${mainMod}, 8, workspace, 8"
            "${mainMod}, 9, workspace, 9"
            "${mainMod}, 0, workspace, 10"

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            "${mainMod} SHIFT, 1, movetoworkspace, 1"
            "${mainMod} SHIFT, 2, movetoworkspace, 2"
            "${mainMod} SHIFT, 3, movetoworkspace, 3"
            "${mainMod} SHIFT, 4, movetoworkspace, 4"
            "${mainMod} SHIFT, 5, movetoworkspace, 5"
            "${mainMod} SHIFT, 6, movetoworkspace, 6"
            "${mainMod} SHIFT, 7, movetoworkspace, 7"
            "${mainMod} SHIFT, 8, movetoworkspace, 8"
            "${mainMod} SHIFT, 9, movetoworkspace, 9"
            "${mainMod} SHIFT, 0, movetoworkspace, 10"

            # Example special workspace (scratchpad)
            "${mainMod}, S, togglespecialworkspace, magic"
            "${mainMod} SHIFT, S, movetoworkspace, special:magic"

            # Scroll through existing workspaces with mainMod + scroll
            "${mainMod}, mouse_down, workspace, e+1"
            "${mainMod}, mouse_up, workspace, e-1"
          ];

          bindm = [
            "${mainMod}, mouse:272, movewindow"
            "${mainMod}, mouse:273, resizewindow"
          ];
        };

      exec-once = [
        #"${pkgs.waybar}/bin/waybar &"
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${pkgs.networkmanagerapplet}/bin/nm-applet &"
        "${pkgs.blueman}/bin/blueman-applet &"
      ];
    };
  };
  home.packages = with pkgs; [

  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = /home/matthias/.dotfiles/wallpapers/desert.jpg
    wallpaper = ,/home/matthias/.dotfiles/wallpapers/desert.jpg
    ipc=true
    splash=false
  '';
}
