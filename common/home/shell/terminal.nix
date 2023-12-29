{ config, pkgs, ...}:

{
   programs.wezterm = {
	enable = true;
	enableBashIntegration = true;
	enableZshIntegration = true;
	extraConfig = ''
local config = {}

if wezterm.config_builder then
   config = wezterm.config_builder()
end

config.tab_and_split_indices_are_zero_based = true
config.audible_bell = "Disabled"
config.automatically_reload_config = true
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 20
config.term = "wezterm"
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tabs_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.set_environment_variables = {
  TERMINFO_DIRS = '/home/user/.nix-profile/share/terminfo',
  WSLENV = 'TERMINFO_DIRS',
}
config.skip_close_confirmation_for_processes_named = {
   "zsh",
   "bash",
   "nvim",
}
config.window_close_confirmation = "NeverPrompt"
config.keys = {
  { key = 'f', mods = 'ALT|CTRL', action = wezterm.action.QuickSelect},
  { key = 'f', mods = 'ALT|SHIFT', action = wezterm.action.Search {CaseInSensitiveString=""}},
}


return config
	'';
   };
}
