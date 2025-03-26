{
  pkgs,
}:

(with pkgs; [ # nixpkgs
  helix
  alacritty
  qutebrowser
  curl
  wget
  git
  pass
  evince
  tmux
  libreoffice
  # zsh
  cryptsetup
  gnupg
  pinentry
  ardour
  surge-XT
  man-pages
  man-pages-posix
  stdmanpages
  sxiv
  watchexec
  pavucontrol
  spotify-qt
  spotifyd
  prismlauncher
  strawberry
  blender
  moreutils
  vlc
  termdown
  hub
  bat
  fzf
  xclip
  ccls
  python3
  rustup
  thunderbird
  # zsh-completions
  # zsh-forgit
  vital
  linuxsampler
  spotify
  pdfgrep
  musescore
  ripgrep
  jq
]) ++ ( # stuff from github
  let repos = [
    {
      owner = "ludviggunne";
      repo = "rmc";
      rev = "baa79fbc4247bae644652c3e8303a015c914a0fd";
      sha256 = "sha256-kW1F5fgDb4nTOXN+AzKueTbbkphp50tr8RZiNcyabYw=";
    }
  ];
  in map (repo: pkgs.callPackage (pkgs.fetchFromGitHub repo) {}) repos
) ++ ( # scripts
  let scripts = [
    {
      path = ./extra/git-fzf.sh;
      name = "git-fzf";
    }
    {
      path = ./extra/pdfind.sh;
      name = "pdfind";
    }
  ];
  in map (script: pkgs.writeShellScriptBin script.name (builtins.readFile script.path)) scripts
)
