{pkgs,...}:

{
	nixpkgs.config = {
		packageOverrides = pkgs: {
			wasilibc = pkgs.wasilibc.override {
					stdenv = pkgs.clangStdenv;
				}
			}
		}
};
