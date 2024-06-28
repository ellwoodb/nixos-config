{pkgs, inputs, ...}: {
  environment.systemPackages = [ # or home.packages
    #inputs.nix-gaming.packages.${pkgs.system}.osu-stable # installs a package
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
  ];
}