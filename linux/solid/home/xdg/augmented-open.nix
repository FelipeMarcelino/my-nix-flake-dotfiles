{ config, pkgs, ...}:
{
   xdg.desktopEntries."AugmentedOpen" = {
	type="Application";
	genericName="Open a file at a certain position";
	Comment="Open URLs of the type file-line-column://<path>[:<line>[:column>]] in the configured editor";
	icon="text-editor";
	exec="open in editor %U";
	Categories=["Utility" "Core"];
	startupNotify=false;
	mimeType="x-scheme-handler/file-line-column";
   };
}
