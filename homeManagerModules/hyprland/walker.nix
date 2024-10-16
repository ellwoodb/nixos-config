{ inputs, ... }:
{
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker = {
    enable = true;
    runAsService = true;

    # All options from the config.json can be used here.
    config = {
      search.placeholder = "Search...";
      ui.fullscreen = true;
      list = {
        height = 200;
      };
      websearch.prefix = "?";
      switcher.prefix = "/";
    };
  };
}
