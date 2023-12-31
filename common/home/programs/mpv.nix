{ config, pkgs, lib,  ...}:
let 
   mpvGalleryViewPlaylist = lib.recurseIntoAttrs (pkgs.callPackage ./mpv_plugins/mpv_gallery_view_playlist.nix {}); 
   mpvGalleryViewSheet = lib.recurseIntoAttrs (pkgs.callPackage ./mpv_plugins/mpv_gallery_view_sheet.nix {}); 
in
{

   home.packages = with pkgs; [ ffmpeg ];

   programs.mpv = {
	enable = true;
	#bindings = builtins.readFile ./input_mpv.conf;
	bindings = {
		"WHEEL_UP" = "add volume 2; script-binding uosc/flash-volume";
		"WHEEL_DOWN" = "add volume -2; script-binding uosc/flash-volume";
		"UP" = "add volume 2; script-binding uosc/flash-volume";
		"DOWN" = "add volume -2; script-binding uosc/flash-volume";
		"AXIS_UP" = "add volume 2; script-binding uosc/flash-volume";
		"AXIS_DOWN" = "add volume -2; script-binding uosc/flash-volume";
		"w" = "add volume 2; script-binding uosc/flash-volume";
		"s" = "add volume -2; script-binding uosc/flash-volume"; 
		"a" = "seek -5; script-binding uosc/flash-timeline";
		"f" = "seek 5; script-binding uosc/flash-timeline";
		"Ctrl+RIGHT" = "seek 85 exact;  script-binding uosc/flash-timeline";
		"Ctrl+LEFT" = "seek -85 exact;  script-binding uosc/flash-timeline";
		"Shift+RIGHT" = "frame-step;  script-binding uosc/flash-timeline";
		"Shift+LEFT" = "frame-back-step;  script-binding uosc/flash-timeline";
		"space" = "cycle pause; script-binding uosc/flash-pause-indicator";
		"H" = "seek -65;  script-binding uosc/flash-timeline ";
		#"h" = "seek 65";
		"v" = "cycle deband";
		">" = "script-binding uosc/next";
		"<" = "script-binding uosc/prev";
		"l" = "script-binding uosc/next";
		"h" = "script-binding uosc/prev";
		"m" = "no-osd cycle mute; script-binding uosc/flash-volume";
		#"s" = "cycle sub";
		"[" =  "no-osd add speed -0.25; script-binding uosc/flash-speed";
		"]" =  "no-osd add speed  0.25; script-binding uosc/flash-speed";
		"i" = "cycle interpolation";
		"t" = "script-message-to seek_to toggle-seeker";
		"+" = "add audio-delay 0.010";
		"-" = "add audio-delay -0.010";
		"F1" = "add sub-delay -0.1";
		"F2" = "add sub-delay +0.1 ";
		"F4" = "cycle-values video-aspect-override \"16:9\" \"4:3\" \"2.35:1\" \"-1\" ";
		"F" = "script-binding quality_menu/video_formats_toggle";
		"Alt+f" = "script-binding quality_menu/audio_formats_toggle";
		"Ctrl+f" = "script-binding quality_menu/reload";
		#"Meta+v" = "script-message-to Mac_Integration OpenFromClipboard";
		#"TAB" = "script-message-to Mac_Integration ShowFinder";
		#"Ctrl+f" = "script-message-to Mac_Integration ShowInFinder";
		#"-" = "add video-zoom -.25";
		#"+" = "add video-zoom .25";
		"kp8" = "add video-pan-y .05";
		"kp6" = "add video-pan-x -.05";
		"kp2" = "add video-pan-y -.05";
		"kp4" = "add video-pan-x .05";
		"kp5" = "set video-pan-x 0; set video-pan-y 0; set video-zoom 0";
		"TAB" = "script-binding uosc/toggle-ui";
		"Alt+space" = "script-message-to uosc toggle-elements top_bar,timeline";
		"mbtn_right" = "script-binding uosc/menu";
		"Alt+Tab" = "script-binding uosc/menu";
		"/" = "script-binding uosc/playlist";
		"Ctrl+s" = "async screenshot"; 
		"?" = "script-binding uosc/keybinds";
		"O" = "script-binding uosc/show-in-directory";
		"o" = "script-binding uosc/open-file";
		"S" = "script-binding uosc/stream-quality";
		"r" = "script-binding uosc/shuffle";
		"g" = "script-message contact-sheet-close; script-message playlist-view-toggle";
		"c" = "script-message playlist-view-close; script-message contact-sheet-toggle";
	};
	package = pkgs.mpv;
	scripts = with pkgs.mpvScripts; [mpris uosc seekTo cutter autoload autocrop thumbfast quality-menu mpv-playlistmanager blacklistExtensions mpvGalleryViewPlaylist mpvGalleryViewSheet];
	config = {
		gpu-api="vulkan";
		hr-seek-framedrop="no";
		border = "no";				
		loop-file="inf";
		loop-playlist="inf";
		fullscreen = "yes";
		force-window = "yes";
		drag-and-drop = "auto";
		terminal = "no";
		idle="once";
		keep-open = "yes";
		msg-color="yes";
		msg-module="yes";
		autofit="85%x85%";
		cursor-autohide=100;
		screenshot-template="/home/felipemarcelino/Pictures/screenshot-%F-T%wH.%wM.%wS.%wT-F%{estimated-frame-number}";
		screenshot-format="png";
		screenshot-png-compression=4;
		screenshot-tag-colorspace="yes";
		screenshot-high-bit-depth="yes";
		osc="no";
		osd-bar="no";
		osd-font="PragmataPro Nerd Font";
		osd-font-size=14;
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
		cache="yes";
		demuxer-max-bytes="123400KiB";
		demuxer-readahead-secs=20;
		audio-file-auto="fuzzy";
		audio-pitch-correction="yes";
		alang="en,pt-br,ja,ja-jp,es,sw";
		#slang = "en,es,sw";
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
		#glsl-shader="./shaders/ravu-zoom-ar-r3-rgb.hook";
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

   };

   home.file."${config.home.homeDirectory}/.config/mpv/script-opts/uosc.conf".source= ./mpv_plugins/uosc.conf;
   home.file."${config.home.homeDirectory}/.config/mpv/script-opts/contact_sheet.conf".source= ./mpv_plugins/contact_sheet.conf;
   home.file."${config.home.homeDirectory}/.config/mpv/script-opts/gallery_worker.conf".source= ./mpv_plugins/gallery_worker.conf;
   home.file."${config.home.homeDirectory}/.config/mpv/script-opts/playlist_view.conf".source= ./mpv_plugins/playlist_view.conf;
   home.file."${config.home.homeDirectory}/.config/mpv/script-modules/gallery.lua".source = "${mpvGalleryViewSheet}/share/mpv/script-modules/gallery.lua";


}
