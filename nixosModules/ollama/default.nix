{ inputs, config, pkgs, ... }:

{
  services.ollama.enable = true;
  services.ollama.acceleration = "cuda";
}
