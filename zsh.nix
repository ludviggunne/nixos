{
  enable = true;
  enableCompletion = true;
  shellAliases = {
    git = "git-fzf";
    rebuild = "sudo nixos-rebuild switch -I nixos-config=$HOME/nixos/configuration.nix";
    config = "$EDITOR $HOME/nixos";
    gitn = "git --no-pager";
    ls = "ls -l";
    ta = "tmux attach-session -t";
    tn = "tmux new-session -s";
    tl = "tmux ls";
    nixde = "echo use nix > .envrc; direnv allow";
    nixdef = "echo use flake > .envrc; direnv allow";
    gclip = "git log --oneline | fzf | cut -f1 -d' ' | xclip -rmlastnl -selection clipboard";
    git-watch = "watchexec --quiet --clear=reset --no-default-ignore --ignore='*.lock' -- git status --short --branch";
  };
  initExtra = ''
    export EDITOR=hx
  '';
  oh-my-zsh = {
    enable = true;
    # theme = "bureau";
    theme = "dst";
    # theme = "afowler";
  };
}
