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

    # eww = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   configDir = ../../home-manager/dotfiles/eww/bar;
    # };

    waybar = {
      catppuccin.enable = true;
      enable = true;
      settings = {
        mainBar = {
        layer = "top";
        position = "top";
        reload_style_on_change = true;
        modules-left = [
          "clock"
          "tray"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "group/expand"
          "bluetooth"
          "network"
          "battery"
        ];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };
          persistent-workspaces = {
            "*" = [
              1
              2
              3
              4
              5
            ];
          };
        };
        clock = {
          format = "{:%I:%M:%S %p} ";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              today = "<span color='#cba6f7'><b>{}</b></span>";
            };
          };
          actions = {
            on-click-right = "shift_down";
            on-click = "shift_up";
          };
        };
        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format-disconnected = "Error";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} 🖧 ";
          on-click = "kitty nmtui";
        };
        bluetooth = {
          format-on = "󰂯";
          format-off = "BT-off";
          format-disabled = "󰂲";
          format-connected-battery = "{device_battery_percentage}% 󰂯";
          format-alt = "{device_alias} 󰂯";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
          on-click-right = "blueman-manager";
        };
        battery = {
          interval = 30;
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󰂄 ";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
        };
        "custom/expand" = {
          format = "";
          tooltip = false;
        };
        "custom/endpoint" = {
          format = "|";
          tooltip = false;
        };
        "group/expand" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 600;
            transition-to-left = true;
            click-to-reveal = true;
          };
          modules = [
            "custom/expand"
            "custom/colorpicker"
            "cpu"
            "memory"
            "temperature"
            "custom/endpoint"
          ];
        };
        cpu = {
          format = "󰻠";
          tooltip = true;
        };
        memory = {
          format = "";
        };
        temperature = {
          critical-threshold = 80;
          format = "";
        };
        tray = {
          icon-size = 14;
          spacing = 10;
        };
      };
      };
      style = ''
        @define-color rosewater #f5e0dc;
        @define-color flamingo #f2cdcd;
        @define-color pink #f5c2e7;
        @define-color mauve #cba6f7;
        @define-color red #f38ba8;
        @define-color maroon #eba0ac;
        @define-color peach #fab387;
        @define-color yellow #f9e2af;
        @define-color green #a6e3a1;
        @define-color teal #94e2d5;
        @define-color sky #89dceb;
        @define-color sapphire #74c7ec;
        @define-color blue #89b4fa;
        @define-color lavender #b4befe;
        @define-color text #cdd6f4;
        @define-color subtext1 #bac2de;
        @define-color subtext0 #a6adc8;
        @define-color overlay2 #9399b2;
        @define-color overlay1 #7f849c;
        @define-color overlay0 #6c7086;
        @define-color surface2 #585b70;
        @define-color surface1 #45475a;
        @define-color surface0 #313244;
        @define-color base #1e1e2e;
        @define-color mantle #181825;
        @define-color crust #11111b;
        * {
            font-size:15px;
            font-family: "Fira-Code";
        }
        window#waybar{
            all:unset;
        }
        .modules-left {
            padding:7px;
            margin:10 0 5 10;
            border-radius:10px;
            background: @base;
            box-shadow: 0px 0px 2px @mantle;
        }
        .modules-center {
            padding:7px;
            margin:10 0 5 0;
            border-radius:10px;
            background: @base;
            box-shadow: 0px 0px 2px @mantle;
        }
        .modules-right {
            padding:7px;
            margin: 10 10 5 0;
            border-radius:10px;
            background: @base;
            box-shadow: 0px 0px 2px @mantle;
        }
        tooltip {
            background:@base;
            color: @green;
        }
        #clock:hover, #custom-pacman:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
            transition: all .3s ease;
            color:@mauve;
        }
        #clock{
            padding: 0px 5px;
            color:@text;
            transition: all .3s ease;
        }
        #workspaces {
            padding: 0px 5px;
        }
        #workspaces button {
            all:unset;
            padding: 0px 5px;
            color: @sky;
            transition: all .2s ease;
        }
        #workspaces button:hover {
            color:@base;
            border: none;
            text-shadow: 0px 0px 1.5px @mantle;
            transition: all 1s ease;
        }
        #workspaces button.active {
            color: @sky;
            border: none;
            text-shadow: 0px 0px 2px @mantle;
        }
        #workspaces button.empty {
            color: @base;
            border: none;
            text-shadow: 0px 0px 1.5px @crust;
        }
        #workspaces button.empty:hover {
            color: @base;
            border: none;
            text-shadow: 0px 0px 1.5px @mantle;
            transition: all 1s ease;
        }
        #workspaces button.empty.active {
            color: @sky;
            border: none;
            text-shadow: 0px 0px 2px @mantle;
        }
        #bluetooth{
            padding: 0px 5px;
            transition: all .3s ease;
            color:@sky;
        
        }
        #network{
            padding: 0px 5px;
            transition: all .3s ease;
            color:@sky;
        
        }
        #battery{
            padding: 0px 5px;
            transition: all .3s ease;
            color:@green;
        
        
        }
        #battery.charging {
            color: @green;
        }
        
        #battery.warning:not(.charging) {
            color: @yellow;
        }
        
        #battery.critical:not(.charging) {
            color: @red;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }
        #group-expand{
            padding: 0px 5px;
            transition: all .3s ease; 
        }
        #custom-expand{
            padding: 0px 5px;
            color:alpha(@foreground,.2);
            text-shadow: 0px 0px 2px @base;
            transition: all .3s ease; 
        }
        #custom-expand:hover{
            color: @mantle;
            text-shadow: 0px 0px 2px @crust;
        }
        #custom-colorpicker{
            padding: 0px 5px;
        }
        #cpu,#memory,#temperature{
            padding: 0px 5px;
            transition: all .3s ease; 
            color:@green;
        
        }
        #custom-endpoint{
            color:transparent;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);
        
        }
        #tray{
            padding: 0px 5px;
            transition: all .3s ease; 
        
        }
        #tray menu * {
            padding: 0px 5px;
            transition: all .3s ease; 
        }
        
        #tray menu separator {
            padding: 0px 5px;
            transition: all .3s ease; 
        }
      '';
    };



  };
}