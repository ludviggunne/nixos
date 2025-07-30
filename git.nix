{
  enable = true;
  userName = "Ludvig Gunne Lindström";
  userEmail = "ludviggunnelindstrom@gmail.com";
  aliases = {
    changes = "log --oneline ORIG_HEAD..";
  };
  extraConfig = {
    core.editor = "hx";
    init.defaultBranch = "main";
    advice.detachedHead = false;
    # core.pager = "bat";
  };
  ignores = [
    ".direnv/"
    ".envrc"
    ".helix/"
    ".ccls-cache/"
    ".cache/"
  ];
}
