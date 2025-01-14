{
  enable = true;
  enableCompletion = true;
  shellAliases = {
    rebuild = "sudo nixos-rebuild switch -I nixos-config=$HOME/nixos/configuration.nix";
    config = "$EDITOR $HOME/nixos";
    gitn = "git --no-pager";
    ls = "ls -l";
    ta = "tmux attach-session -t";
    tn = "tmux new-session -s";
    tl = "tmux ls";
    nixde = "echo use nix > .envrc; direnv allow";
    nixdef = "echo use flake > .envrc; direnv allow";
  };
  initExtra = ''
    export EDITOR=hx
  '';
  oh-my-zsh = {
    enable = true;
    theme = "afowler";
  };
}
