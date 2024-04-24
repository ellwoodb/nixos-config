{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  services.ollama.enable = true;
  services.ollama.acceleration = "cuda";
}
