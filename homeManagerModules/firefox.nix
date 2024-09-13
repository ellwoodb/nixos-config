{ inputs, config, pkgs, lib, ... }:

{
  options = {
    firefox-conf.enable =
      lib.mkEnableOption "enables Firefox config";
  };

  config = lib.mkIf config.firefox-conf.enable {
    programs.firefox = {
      enable = true;
      policies = {
        "SearchEngines" = {
          "Default" = "Brave";
        };
      };
      profiles = {
        default = {
          id = 0;
          name = "default";
          search = {
            force = true;
            default = "Brave";
            order = [ "Brave" "Google" ];
            engines = {
              "Brave" = {
                urls = [{ template = "https://search.brave.com/search?q={searchTerms}"; }];
                iconUpdateURL = "https://cdn.search.brave.com/serp/v2/_app/immutable/assets/favicon-32x32.B2iBzfXZ.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@brave" ];
              };
            };
          };
          extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
            bitwarden
            ublock-origin
            darkreader
            tabliss
            tree-style-tab
          ];
          userChrome = ''
            #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
              opacity: 0;
              pointer-events: none;
            }

            #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
                visibility: collapse !important;
            }

            /* Adding empty space for buttons */

            #nav-bar {
            	margin-right:95px;
            }

            /* 10px for dragging whole window by mouse*/

            #titlebar {
            	appearance: none !important;
            	height: 10px;
            }

            /* Fix for main menu calling by Alt button */

            #titlebar > #toolbar-menubar {
            	margin-top: 10px;
            }

            /* Move minimize/restore/close buttons to empty space */

            #TabsToolbar > .titlebar-buttonbox-container {
            	display: block;
            	position: absolute;
            	top: 17px;
            	right: 1px;
            }

            #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
              display: none;
            }
          '';
        };
      };
    };
  };
}
