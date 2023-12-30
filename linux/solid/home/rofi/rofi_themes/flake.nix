{
 outputs = { self, nixpkgs }: {
    packages.x86_64-linux.rofi-themes =
      let pkgs = import nixpkgs {
            system = "x86_64-linux";
          };
      in pkgs.stdenv.mkDerivation {
	   name = "rofi-themes";
	   src = pkgs.fetchFromGitHub {
		owner = "adi1090x";
		repo = "rofi";
		rev = "master";
		sha256 = "sha256-YjyrxappcLDoh3++mtZqCyxQV2qeoNhhUy2XGwlyTng=";
	   };

	   buildInputs = [ pkgs.bash pkgs.fontconfig ];

	   buildPhase = ''
	   	export HOME=$(pwd)
	   '';

	   installPhase = ''
	   	mkdir -p $out
		bash $src/setup.sh 
		cp -rf $src/* $out/
		echo '#!/bin/sh' > $out/bin/rofi-themes
		chmod +x $out/bin/rofi-themes
	   '';
    };
    # Specify the default package
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.rofi-themes; # <- add this
  };
}
