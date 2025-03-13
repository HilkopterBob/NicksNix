{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  nc = import ../fonts/nerd-char.nix {inherit config;};

  # Mocha palette
  # https://github.com/catppuccin/starship/blob/ee9763c6bd3c5bada9de23678b4e4e33b01e71ae/palettes/mocha.toml
  color = {
    rosewater = "#f5e0dc";
    flamingo = "#f2cdcd";
    pink = "#f5c2e7";
    mauve = "#cba6f7";
    red = "#f38ba8";
    maroon = "#eba0ac";
    peach = "#fab387";
    yellow = "#f9e2af";
    green = "#a6e3a1";
    teal = "#94e2d5";
    sky = "#89dceb";
    sapphire = "#74c7ec";
    blue = "#89b4fa";
    lavender = "#b4befe";
    text = "#cdd6f4";
    subtext1 = "#bac2de";
    subtext0 = "#a6adc8";
    overlay2 = "#9399b2";
    overlay1 = "#7f849c";
    overlay0 = "#6c7086";
    surface2 = "#585b70";
    surface1 = "#45475a";
    surface0 = "#313244";
    base = "#1e1e2e";
    mantle = "#181825";
    crust = "#11111b";
  };
in

{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  programs = {
    git = {
      enable = true;
      userName = "HilkopterBob";
      userEmail = "podewils08@gmail.com";
    };

    kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      shellAliases = {
        ".." = "cd ..";
        rebuild = "sudo nixos-rebuild switch --flake /home/nick/NicksNix/.#nixos";
        cd = "z";
        ls = "eza --icons";
        cat = "bat";
      };
      initExtra = ''
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
        eval "$(zoxide init zsh)"
      '';
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };

    tmux = {
      enable = true;
    };

    starship = {
      enable = true;
      settings = {
        palette = "catppuccin_mocha";
        palettes.catppuccin_mocha = {
          black = color.base;
          red = color.red;
          green = color.green;
          yellow = color.yellow;
          blue = color.blue;
          purple = color.mauve;
          cyan = color.lavender;
          white = color.text;
          bright-black = color.subtext0;
          bright-red = color.pink;
          bright-green = color.teal;
          bright-yellow = color.peach;
          bright-blue = color.sapphire;
          bright-purple = color.flamingo;
          bright-cyan = color.sky;
          bright-white = color.subtext1;
        };
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    bat = {
      enable = true;
    };
  };

  fonts = {
    packages = with pkgs; [nerdfonts];
    fontconfig = {
      enable = true;
      defaultFonts.emoji = ["nerdfonts"];
      defaultFonts.monospace = ["nerdfonts"];
      defaultFonts.sansSerif = ["nerdfonts"];
      defaultFonts.serif = ["nerdfonts"];
    };
  };


}