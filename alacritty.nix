{
  enable = true;
  settings = {
    shell = "bash";
    import = [ "~/.config/alacritty/${import ./theme.nix}.toml" ];
    font = {
      size = 7;
      normal = {
        family = "Terminus";
      };
    };
    cursor.style = { shape = "Beam"; blinking = "Off"; };
  };
}
