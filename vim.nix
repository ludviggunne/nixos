{
  pkgs,
  ...
}:

{
  enable = true;
  plugins = with pkgs.vimPlugins; [
    slimv
  ];
  extraConfig = builtins.readFile ./extra/vimrc;
}
