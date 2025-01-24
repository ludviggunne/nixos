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
  zsh
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
  qbittorrent
  vlc
  termdown
  hub
  bat
  gh
  gh-dash
  gh-notify
  fzf
  xclip
  ccls
  python3
]) ++ ( # stuff from github
  let repos = [
    {
      owner = "ludviggunne";
      repo = "rmc";
      rev = "3e99eb0663c07aaf8b3f599d011f38990fab3554";
      sha256 = "sha256-samSitJttnoWIAqtlkwtOKwKdAklNtDv2oQ5WI/v4b4=";
    }
  ];
  in map (repo: pkgs.callPackage (pkgs.fetchFromGitHub repo) {}) repos
)
