{ lib, pkgs, ...}:

pkgs.stdenv.mkDerivation rec {
   pname = "rofi-themes";
   src = pkgs.fetchFromGitHub {
	owner = "adi1090x";
	repo = "rofi";
	rev = "master";
	sha256 = "sha256-YjyrxappcLDoh3++mtZqCyxQV2qeoNhhUy2XGwlyTng=";
   };

   buildPhase = ''
	mkdir -p $out
	chmod +x $src/setup.sh
   '';

   buildInputs = [ pkgs.bash ];

   installPhase = ''
	bash $src/setup.sh 
	cp -rf $src/* $out/
	echo '#!/bin/sh' > $out/bin/rofi-themes
	chmod +x $out/bin/rofi-themes
   '';

   #phases = [ "unpackPhase" "buildPhase" "installPhase" ];
}
