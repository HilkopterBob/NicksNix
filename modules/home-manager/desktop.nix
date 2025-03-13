{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  nc = import ../fonts/nerd-char.nix {inherit config;};
in {
  programs = {

    eww = {
      enable = true;
      enableZshIntegration = true;
      configDir = ../../home-manager/dotfiles/eww;
    };

  };
}