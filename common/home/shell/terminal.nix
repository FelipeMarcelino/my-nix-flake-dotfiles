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

return config
	'';
   };
}
