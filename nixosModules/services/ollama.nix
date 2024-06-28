{ inputs, config, pkgs, lib, ... }:

{
  options = {
    ollama.enable =
      lib.mkEnableOption "enables Ollama local llm service";
  };

  config = lib.mkIf config.ollama.enable {
    services.ollama.enable = true;
    services.ollama.acceleration = "cuda";
  };
}
