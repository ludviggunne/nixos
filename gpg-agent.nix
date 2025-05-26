{
  pkgs
}:

{
  enable = true;
  enableBashIntegration = true;
  pinentryPackage = pkgs.pinentry-curses;
}
