{ inputs, config, pkgs, lib, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

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

    font = {
      name = "Sans";
      size = 11;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [ "DP-4,3440x1440@165,0x0,1" "HDMI-A-2,1920x1080@60,3440x180,1" ];

      exec = [ 
        
      ];
      exec-once = [
        "systemctl --user start plasma-polkit-agent"
        "swaync"
        "${pkgs.waybar}/bin/waybar"
      ];

      env = [
        "XCURSOR_SIZE,16"

        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      general = {
        gaps_in = 3;
        gaps_out = 8;

        border_size = 1;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };

      cursor = {
        no_hardware_cursors = true;
      };

      workspace = [
        "1,monitor:DP-4,default:true"
        "2,monitor:HDMI-A-2"
        "3,monitor:DP-4"
        "4,monitor:DP-4"
        "5,monitor:DP-4"
        "6,monitor:DP-4"
        "7,monitor:DP-4"
        "8,monitor:HDMI-A-2"
        "9,monitor:HDMI-A-2"
      ];

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

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        smart_split = true;
      };

      master = {
        new_status = "dwindle";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "de";
        kb_variant = "nodeadkeys";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = -0.3;
        accel_profile = "flat";

        touchpad = {
          natural_scroll = false;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = false;
      };

      "$mainMod" = "SUPER";
      "$terminal" = "${pkgs.alacritty}/bin/alacritty";
      "$fileManager" = "${pkgs.nautilus}/bin/nautilus";
      #"$runMenu" = "${pkgs.wofi}/bin/wofi --show drun";
      "$runMenu" = "${pkgs.wofi}/bin/wofi --show drun";

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, W, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, F, fullscreen,"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindr = [
        "$mainMod, SPACE, exec, pkill wofi || $runMenu"
      ];

      windowrulev2 = [ 
        "suppressevent maximize, class:.*" 
      ];
    };
  };
}
