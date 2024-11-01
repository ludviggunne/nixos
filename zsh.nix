{
  enable = true;
  enableCompletion = true;
  shellAliases = {
    rebuild = "sudo nixos-rebuild switch -I nixos-config=$HOME/nixos/configuration.nix";
    config = "$EDITOR $HOME/nixos";
  };
  initExtra = ''
    export EDITOR=hx
  '';
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "afowler";
  };
}
