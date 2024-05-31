{ inputs, config, pkgs, hyprland, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = with hyprplugins; [
      hyprexpo
    ];

    systemd.variables = [ "--all" ];

    settings = {

      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(111111)";
          workspace_method = "first 1";
        };
      };

      input = {
        kb_layout = "de";
        kb_variant = "nodeadkeys";
        sensitivity = 1.0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        "col.active_border" = "rgba(${base07}FF)";
        "col.inactive_border" = "rgba(${base00}FF)";
        layout = "master";
      };

      decoration = {
        rounding = 5;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(${base00}EE)";
      };

      misc = {
        disable_hyprland_logo = true;
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutBack,0.34,1.56,0.64,1"
          "myBezier,0.05,0.9,0.1,1.05"
        ];
        animation = [
          "windows,1,7,myBezier"
          "windowsOut,1,7,default,popin 0%"
          "border,1,10,default"
          "fade,1,7,default"
          "workspaces,1,4,default,slidevert"
          "specialWorkspace,1,6,easeOutBack,slide"
        ];
      };

      master = {
        new_is_master = false;
        mfact = "0.5";
      };

      windowrulev2 = [
        # Make All Windows Floating By Default
        "float, class:.*"

        # Except ...
        "maximize, class:^(firefox)$"
      ];

      # Issue due to Hyprland (v0.40.0) and Nvidia-Drivers
      monitor = [ "Unknown-1,disable" ];

      keybindings =
        let
          mainMod = "SUPER";
          workspaces = [ 1 2 3 4 5 6 7 8 9 ];
        in
        {
          bind =
            (map
              (x:
                "${mainMod}, ${(toString x)}, workspace, ${(toString x)}")
              workspaces)
            ++
            (map
              (x:
                "${mainMod} SHIFT, ${(toString x)}, movetoworkspace, ${(toString x)}")
              workspaces)
            ++
            [
              "${mainMod}, return, exec, alacritty"
              "${mainMod}, B, exec, firefox"
              "${mainMod}, C, killactive,"
              "${mainMod}, P, exec, pcmanfm"
              "${mainMod}, F, togglefloating,"
              "${mainMod}, space, exec, rofi -show drun"
              "${mainMod}, O, exec, hyprpicker | tr -d '\\n' | wl-copy"
              "${mainMod}, W, exec, grim -g \"$(slurp)\""
              "${mainMod}, E, exec, emacs"
              "${mainMod}, A, exec, amixer sset Master 5%-"
              "${mainMod}, D, exec, amixer sset Master 5%+"
              "${mainMod}, S, exec, amixer sset Master toggle"
              "${mainMod}, H, movefocus, l"
              "${mainMod}, J, movefocus, d"
              "${mainMod}, K, movefocus, u"
              "${mainMod}, L, movefocus, r"
              "${mainMod} CTRL, H, movewindow, l"
              "${mainMod} CTRL, J, movewindow, d"
              "${mainMod} CTRL, K, movewindow, u"
              "${mainMod} CTRL, L, movewindow, r"
              "${mainMod}, mouse_down, workspace, e-1"
              "${mainMod}, mouse_up, workspace, e+1"
              # Hyprexpo
              "${mainMod}, p, hyprexpo:expo, toggle"
            ];

          bindm =
            [
              "${mainMod}, mouse:272, movewindow"
              "${mainMod}, mouse:273, resizewindow"
            ];
        };

      exec-once = [
        "${pkgs.waybar}/bin/waybar &"
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${pkgs.networkmanagerapplet}/bin/nm-applet &"
      ];
    };
  };

  home.packages = with pkgs; [
    hyprpaper
    hyprshot
    hyprlock
    hypridle
    hyprpicker
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.dotfiles/wallpapers/landscape.png
    wallpaper = ,~/.dotfiles/wallpapers/landscape.png
    ipc=true
    splash=false
  '';

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
