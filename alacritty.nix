{
  enable = true;
  settings = {
    shell = "zsh";
    import = [ "~/.config/alacritty/zenburn.toml" ];
    font = {
      size = 6;
      normal = {
        family = "terminus";
      };
    };
    cursor.style = { shape = "Beam"; blinking = "Off"; };
  };
}
