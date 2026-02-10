{stdenv, fetchFromGithub, pkgconfig, cmake,  makeWrapper, lib, ...}:

stdenv.mkdDerivation rec {
  pname = "neovim";
  version = "6ad7342";

  /* version = "https://github.com/neovim/neovim/archive/6ad7342.tar.gz"; */

  src = fetchFromGithub {
    owner = "neovim";
    repo = "neovim";
    rev = "6ad7342";
    /* Use `nix-prefetch-url --unpack https://github.com/neovim/neovim/archive/{commithash}.tar.gz`
to generate the sha256 hash */
    sha256 = "1g0sngrmb39xix0r40a7blgfv19gvahwbjiqjbsg101q38yv7xxd";
  };

  buildInputs = [ pkgconfig cmake makeWrapper ];
  buildPhase = "make CMAKE_BUILD_TYPE=RelWithDebInfo";
  installPhase = "sudo make install";
}
