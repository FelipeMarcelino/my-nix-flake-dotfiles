{ config, pkgs, ...}:

{
   programs.mpv = {
   	enable = true;
	config = {
		gpu-api="vulkan";
		hr-seek-framedrop="no";
		border= "no";				
		msg-color="yes";
		msg-module="yes";
		autofit="85%x85%";
		cursor-autohide=100;
		screenshot-template="%x/Screens/Screenshot-%F-T%wH.%wM.%wS.%wT-F%{estimated-frame-number}";
		screenshot-format="png";
		screenshot-png-compression=4;
		screenshot-tag-colorspace="yes";
		screenshot-high-bit-depth="yes";
		osc="no";
		osd-bar="yes";
		osd-font="Inter Tight Medium";
		osd-font-size=30;
		osd-color="#CCFFFFFF";
		osd-border-color="#DD322640";
		osd-bar-align-y=-1;
		osd-border-size=2;
		osd-bar-h=1;
		osd-bar-w=60;
		blend-subtitles="no";
		sub-ass-vsfilter-blur-compat="yes";
		sub-ass-scale-with-window="no";
		sub-auto="fuzzy";                       
		sub-file-paths-append="ass:srt:subtitles:sub:subs";               	
		demuxer-mkv-subtitle-preroll="yes";
		embeddedfonts="yes";
		sub-fix-timing="no";
		sub-font="Open Sans SemiBold";
		sub-font-size=46;
		sub-blur=0.3;
		sub-border-color="0.0/0.0/0.0/0.8";
		sub-border-size=3.2;
		sub-color="0.9/0.9/0.9/1.0";
		sub-margin-x=100;
		sub-margin-y=50;
		sub-shadow-color="0.0/0.0/0.0/0.25";
		sub-shadow-offset=0;
		volume-max=150;
		audio-stream-silence=true;
		audio-file-auto="fuzzy";
		audio-pitch-correction="yes";
		alang="jpn,jp,eng,en,enUS,en-US,de,ger";
		slang="eng,en,und,de,ger,jp,jap";
	};

   defaultProfiles = [ "high-quality" ];

   profiles = {
	high-quality = {
		hwdec="auto-copy";
		vo="gpu-next";
		dither-depth="auto";
		deband="yes";
		deband-iterations=4;
		deband-threshold=35;
		deband-range=16;
		deband-grain=4;
		glsl-shader="./shaders/ravu-zoom-ar-r3-rgb.hook";
		scale="ewa_lanczos";
		scale-blur=0.981251;
		dscale="catmull_rom";
		correct-downscaling="yes";
		linear-downscaling="no";
		#glsl-shader="./shaders/CfL_Prediction.glsl";
		cscale="lanczos";
		sigmoid-upscaling="yes";
		video-sync="display-resample";
		interpolation="yes";
		tscale="sphinx";
		tscale-blur="0.6991556596428412";
		tscale-radius="1.05";
		tscale-clamp="0.0";
		tone-mapping="bt.2446a";
		target-colorspace-hint="yes";
		deinterlace="no";
	};
	};

   bindings = {
		WHEEL_UP="add volume 2";
		WHEEL_DOWN="add volume -2";
		UP="add volume 2";
		DOWN="add volume -2";
		AXIS_UP="add volume 2";
		AXIS_DOWN="add volume -2";
		"Ctrl+RIGHT"="seek 85 exact";
		"Ctrl+LEFT"="seek -85 exact";
		"Shift+RIGHT"="frame-step";
		"Shift+LEFT"="frame-back-step";
		H="seek -65";
		h="seek 65";
		v="cycle deband";
		a="cycle audio";
		s="cycle sub";
		i="cycle interpolation";
		t="script-message-to seek_to toggle-seeker";
		"+"="add audio-delay 0.010";
		"-"="add audio-delay -0.010";
		"F1"="add sub-delay -0.1";
		"F2"="add sub-delay +0.1"; 
		"F4"="cycle-values video-aspect-override '16:9' '4:3' '2.35:1' '-1'";
		F="script-binding quality_menu/video_formats_toggle";
		"Alt+f"="script-binding quality_menu/audio_formats_toggle";
		"Ctrl+r"="script-binding quality_menu/reload";
		"Meta+v"="script-message-to Mac_Integration OpenFromClipboard";
		TAB="script-message-to Mac_Integration ShowFinder";
		"Ctrl+f"="script-message-to Mac_Integration ShowInFinder";
		kp8="add video-pan-y .05";
		kp6="add video-pan-x -.05";
		kp2="add video-pan-y -.05";
		kp4="add video-pan-x .05";
		kp5="set video-pan-x 0; set video-pan-y 0; set video-zoom 0";
		   };
		   };
}
