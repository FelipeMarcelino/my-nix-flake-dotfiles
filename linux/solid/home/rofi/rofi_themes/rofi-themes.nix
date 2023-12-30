{ lib, stdenv, fetchFromGitHub, bash, ...}:

stdenv.mkDerivation {
   name = "rofi-themes";
   src = fetchFromGitHub {
	owner = "adi1090x";
	repo = "rofi";
	rev = "master";
	sha256 = "sha256-YjyrxappcLDoh3++mtZqCyxQV2qeoNhhUy2XGwlyTng=";
   };

   buildInputs = [ bash ];

   installPhase = ''
   	mkdir -p $out/bin
	cp setup.sh $out/bin/setup.sh 
	cp -rf files $out/bin/files
	cp -rf fonts $out/bin/fonts
	cp -rf previews $out/bin/previews
	bash $out/bin/setup.sh
   '';
}
