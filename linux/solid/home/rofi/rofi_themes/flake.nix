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

	   buildInputs = [ pkgs.bash ];

	   installPhase = ''
		mkdir -p $out/bin
		cp setup.sh $out/bin/setup.sh 
		cp -rf files $out/bin/files
		cp -rf fonts $out/bin/fonts
		cp -rf previews $out/bin/previews
		bash $out/bin/setup.sh
	   '';
    }
    # Specify the default package
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.rofi-themes; # <- add this
  };
}
