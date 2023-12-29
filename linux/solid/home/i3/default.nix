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
	     { output = ["HDMI-0"]; workspace = "8:misc"; } # Possible chatgpt? 
	     { output = ["DP-0"]; workspace = "9:player"; } 
	     { output = ["HDMI-0"]; workspace = "10:social"; }
	   ];

	   assigns = {
		"1:code" =
		[
		    { class = "^org.wezfurlong.wezterm$";}
		];
		"4:web" =
		[
		    { class = "^firefox$";}
		];
		"5:app" =
		[
		    { class = "^discord$";}
		    { class = "^TelegramDesktop$";}
		];
		"6:reader" =
		[
		    { class = "^Zathura$";}
		];
		"9:player" =
		[
		    { class = "^Spotify$";}
		    { class = "^io.github.celluloid_player.Celluloid$";}
		    { class = "^.arandr-wrapped$";}
		];
	   };

	   floating.criteria = 
	   [
		{ class = "^Pavucontrol$";}
		{ class = "^.blueman-manager-wrapped$";}
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
 	    "${mod}+1" =  "workspace number 1:code";
 	    "${mod}+2" =  "workspace number 2:code";
 	    "${mod}+3" =  "workspace number 3:zet";
 	    "${mod}+4" =  "workspace number 4:web";
 	    "${mod}+5" =  "workspace number 5:app";
 	    "${mod}+6" =  "workspace number 6:reader";
 	    "${mod}+7" =  "workspace number 7:kanban";
 	    "${mod}+8" =  "workspace number 8:misc";
 	    "${mod}+9" =  "workspace number 9:player";
	    "${mod}+0" =  "workspace number 10:social";
	    "${mod}+Shift+1" = "move container to workspace number 1:code";
       	    "${mod}+Shift+2" = "move container to workspace number 2:code";
	    "${mod}+Shift+3" = "move container to workspace number 3:zet";
	    "${mod}+Shift+4" = "move container to workspace number 4:web";
	    "${mod}+Shift+5" = "move container to workspace number 5:app";
	    "${mod}+Shift+6" = "move container to workspace number 6:reader";
	    "${mod}+Shift+7" = "move container to workspace number 7:kanban";
	    "${mod}+Shift+8" = "move container to workspace number 8:misc";
	    "${mod}+Shift+9" = "move container to workspace number 9:player";
	    "${mod}+Shift+0" = "move container to workspace number 10:social";
	    "${mod}+Control+k" = "exec --no-startup-id wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+; exec --no-startup-id NotifyVol up";
	    "${mod}+Control+j" = " exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-; exec --no-startup-id NotifyVol down";
	    "${mod}+Control+space" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle; exec --no-startup-id NotifyVol mute";
	    "${mod}+Control+h" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
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
    };
}
