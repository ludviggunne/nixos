{
  enable = true;
  settings = {
    terminal.shell = "zsh";
    general.import = [ "~/.config/alacritty/zenburn.toml" ];
    font = {
      size = 7;
      normal = {
        family = "SauceCodePro Nerd Font Mono";
      };
    };
    cursor.style = { shape = "Beam"; blinking = "Off"; };
  };
}
