{ pkgs ? import <nixpkgs> {} }:

let
  easy-ps = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "2f56e0895959db39293942786d4d346524360e5b";
    sha256 = "0vaqn0v6abffzma9gfv5cwknz4kpc3kj50siia5cv2mp752b8w98";
  });

in pkgs.stdenv.mkDerivation {
  name = "easy-purescript";
  buildInputs = builtins.attrValues {
    inherit (easy-ps.inputs)
      purs
      psc-package2nix;
  };
}
