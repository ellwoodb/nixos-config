{ inputs, config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    ollama.enable =
      lib.mkEnableOption "enables Ollama local llm service";
  };

  config = lib.mkIf config.ollama.enable {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
      acceleration = "cuda";
      host = "0.0.0.0";
      port = 11434;
      #listenAddress = "0.0.0.0:11434";
    };
  };
}
