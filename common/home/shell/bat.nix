{config, pkgs, ...}:

{
    programs.bat = {
	enable = true;
	config = {
	   italic-text="always";
	   style="numbers,header,grid,snip";
	   tabs="4";
	};
    };
}
