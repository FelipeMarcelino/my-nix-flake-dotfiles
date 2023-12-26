{ config, pkgs, ...}:
let 
  mod = "Mod1";
in {
    programs.i3status.enable = true;
    programs.i3status-rust.enable = true;
    xsession.windowManager.i3 = {
	enable = true;
	package = pkgs.i3-gaps;
	config = {
	   modifier = mod;
	   terminal = "wezterm";
	   workspaceOutputAssign = [
	     { output = ["DP-0"]; workspace = "1:code"; }
	     { output = ["HDMI-0"]; workspace = "2:code"; }
	     { output = ["DP-0"]; workspace = "3:zet"; }
	     { output = ["HDMI-0"]; workspace = "4:web"; }
	     { output = ["DP-0"]; workspace = "5:app"; }
	     { output = ["HDMI-0"]; workspace = "6:reader"; }
	     { output = ["DP-0"]; workspace = "7:kanban"; }
	     { output = ["HDMI-0"]; workspace = "8:player"; }
	     { output = ["DP-0"]; workspace = "9:misc"; }
	     { output = ["HDMI-0"]; workspace = "10:social"; }
	   ];

	   workspaceAutoBackAndForth = true;   
	   keybindings = {
	    "${mod}+h" = "focus left";
	    "${mod}+l" = "focus right";
	    "${mod}+j" = "focus down";
	    "${mod}+k" = "focus up";
	    "${mod}+Return" = "exec --no-startup-id wezterm";
	    "${mod}+d" = "exec rofi -modi drun -show drun";
	    "${mod}+comma" = "kill";
	    "${mod}+Shift+c" = "reload";
	    "${mod}+Shift+r" = "restart";
	    "${mod}+Shift+j" = "move down";
	    "${mod}+Shift+k" = "move up";
	    "${mod}+Shift+h" = "move left";
	    "${mod}+Shift+l" = "move right";
	    "${mod}+f" = "fullscreen toggle";
	    "${mod}+c" = "split h";
            "${mod}+v" = "split v";
            "${mod}+p" = "exec --no-startup-id \"flameshot screen\"";
            "${mod}+Shift+p" = "exec --no-startup-id \"flameshot gui\"";
	    "${mod}+s" = "layout stacking";
            "${mod}+w" = "layout tabbed";
            "${mod}+e" = "layout toggle split";
            "${mod}+Shift+space" = "floating toggle";
            "${mod}+space" = "focus mode_toggle";
            "${mod}+Shift+e" = "exec i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'";
 	    "${mod}+1" =  "workspace number $ws1";
 	    "${mod}+2" =  "workspace number $ws2";
 	    "${mod}+3" =  "workspace number $ws3";
 	    "${mod}+4" =  "workspace number $ws4";
 	    "${mod}+5" =  "workspace number $ws5";
 	    "${mod}+6" =  "workspace number $ws6";
 	    "${mod}+7" =  "workspace number $ws7";
 	    "${mod}+8" =  "workspace number $ws8";
 	    "${mod}+9" =  "workspace number $ws9";
	    "${mod}+0" =  "workspace number $ws10";
	    "${mod}+Shift+1" = "move container to workspace number $ws1";
       	    "${mod}+Shift+2" = "move container to workspace number $ws2";
	    "${mod}+Shift+3" = "move container to workspace number $ws3";
	    "${mod}+Shift+4" = "move container to workspace number $ws4";
	    "${mod}+Shift+5" = "move container to workspace number $ws5";
	    "${mod}+Shift+6" = "move container to workspace number $ws6";
	    "${mod}+Shift+7" = "move container to workspace number $ws7";
	    "${mod}+Shift+8" = "move container to workspace number $ws8";
	    "${mod}+Shift+9" = "move container to workspace number $ws9";
	    "${mod}+Shift+0" = "move container to workspace number $ws10";
	   };
	window = {
	   titlebar = false;
	   hideEdgeBorders = "smart";
	};
	gaps = {
	   smartGaps = true;
	   smartBorders = "on";
	   inner = 5;
	   outer = 5;
	};
	};
	extraConfig = ''
	    set $ws1 "1:code";
	    set $ws2 "2:code";
	    set $ws3 "3:zet";
	    set $ws4 "4:web";
	    set $ws5 "5:app";
	    set $ws6 "6:reader";
	    set $ws7 "7:kanban";
	    set $ws8 "8:player";
	    set $ws9 "9:misc";
	    set $ws10 "10:social"
	'';

    };
}
