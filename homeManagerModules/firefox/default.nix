{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      "SearchEngines" = {
        "Default" = "Brave";
        "PreventInstalls" = true;
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
              iconUpdateURL = "https://nixos.wiki/favicon.png";
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
        ];
      };
    };
  };
}
