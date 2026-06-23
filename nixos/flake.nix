{
	inputs = {
		thyx.url = "github:rccyx/thyx";
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake/beta";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, zen-browser, thyx, ... }:
		let
		system = "x86_64-linux";
	pkgs = import nixpkgs { inherit system; };
	in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix

					thyx.nixosModules.default
					{
						services.displayManager.sddm.thyx.enable = true;
						services.displayManager.sddm.wayland.enable = true;
					}
			];
			specialArgs = { inherit zen-browser; };
		};
	};
}
