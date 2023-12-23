{ config, pkgs, ...}:
let 
  mod = "Mod1";
in {
    programs.i3status.enable = true;
    xsession.windowManager.i3 = {
	enable = true;
	package = pkgs.i3-gaps;
	config = {
	   modifier = mod;
	   terminal = "wezterm";
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
            "${mod}+Shift+e" = "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'";
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
	    set $ws1 "1";
	    set $ws2 "2";
	    set $ws3 "3";
	    set $ws4 "4";
	    set $ws5 "5";
	    set $ws6 "6";
	    set $ws7 "7";
	    set $ws8 "8";
	    set $ws9 "9";
	    set $ws10 "10"
	'';
    };
}
