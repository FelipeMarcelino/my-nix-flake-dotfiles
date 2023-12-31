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

	   buildPhase = ''
		export FONTCONFIG_FILE=$XDG_CONFIG_HOME/fontconfig/conf.d/10-hm-fonts.conf
		export FONTCONFIG_PATH=$XDG_CONFIG_HOME/fontconfig/conf.d
		export HOME=$(pwd)
		mkdir -p $out
		chmod +x $src/setup.sh
	   '';

	   buildInputs = [ pkgs.bash pkgs.fontconfig ];
	   #buildInputs = [ pkgs.bash ];

	   installPhase = ''
		bash $src/setup.sh 
		cp -rf $src/* $out/
		echo '#!/bin/sh' > $out/bin/rofi-themes
		chmod +x $out/bin/rofi-themes
	   '';

	   phases = [ "unpackPhase" "buildPhase" "installPhase" ];
    };
    # Specify the default package
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.rofi-themes; # <- add this
  };
}
