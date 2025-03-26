{
  enable = true;
  userName = "Ludvig Gunne Lindström";
  userEmail = "ludviggunnelindstrom@gmail.com";
  aliases = {
    ci = "commit";
    st = "status";
    ap = "add --patch";
    dc = "diff --cached";
    cia = "commit --amend";
    ri = "rebase -i";
    sw = "switch";
    d = "diff";
    sc = "switch --create";
    co = "checkout";
  };
  extraConfig = {
    core.editor = "hx";
    init.defaultBranch = "main";
    # core.pager = "bat";
  };
  ignores = [
    ".direnv/"
    ".envrc"
    "*.nix"
    ".helix/"
    ".ccls-cache/"
  ];
}
