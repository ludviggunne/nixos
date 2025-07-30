{ pkgs ? import <nixpkgs> {} }:

let
  fetch-repo = repo: pkgs.callPackage (pkgs.fetchFromGitHub repo) {};
  gdb-scripts = fetch-repo {
    owner = "ludviggunne";
    repo = "gdb-scripts";
    rev = "17545e9ac5eb17ebe8809d3b33ff9ecd8a6e4246";
    sha256 = "sha256-tX+Sp1fVSQxegbox2ZWWPMwlCagpWWLpnWG9nwY5X1o";
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
