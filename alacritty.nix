{
  enable = true;
  settings = {
    shell = "bash";
    import = [ "~/.config/alacritty/${import ./theme.nix}.toml" ];
    font = {
      size = 7;
      normal = {
        family = "Hack Nerd Font Mono";
      };
    };
    cursor.style = { shape = "Beam"; blinking = "Off"; };
  };
}
