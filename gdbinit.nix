{ pkgs ? import <nixpkgs> {} }:

let
  fetch-repo = repo: pkgs.callPackage (pkgs.fetchFromGitHub repo) {};
  gdb-scripts = fetch-repo {
    owner = "ludviggunne";
    repo = "gdb-scripts";
    rev = "5c56ccd9eec852067987ed13f0be72bad3553329";
    sha256 = "sha256-mRw/AX4k0Zy1GuZUIOUm2cnupjoD9kP/NyEg+f4Z68g=";
  };
in

''
set auto-load safe-path /
set auto-load local-gdbinit
set print pretty on
set index-cache enabled on
set history remove-duplicates unlimited
set style enabled off

source ${gdb-scripts}/source.py
''
