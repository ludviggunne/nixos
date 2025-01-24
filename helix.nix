{
  pkgs,
}:

{
  enable = true;
  settings = {
    theme = "monochrome";
    editor = {
      line-number = "relative";
      mouse = false;
      statusline.center = [ "version-control" ];
      smart-tab.enable = false;
      auto-completion = false;
      auto-pairs = false;

      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      file-picker = {
        hidden = true;
        git-ignore = true;
      };
    };

    keys = let common = {
        C-j = [ "goto_next_paragraph" ];
        C-k = [ "goto_prev_paragraph" ];
        C-y = [ ":clipboard-yank" ];
        C-h = [ "flip_selections" ];
    }; in {
      normal = common // {
        S-d = [ "vsplit" "goto_definition" ];
        C-r = [ ":reload" ];
      };
      select = common // {};
    };
  };

  languages = {
    language-server.ccls = { command = "${pkgs.ccls}/bin/ccls"; };
    language = [
      {
        name = "c";
        language-servers = [ "ccls" ];
      }
      {
        name = "cpp";
        language-servers = [ "ccls" ];
      }
    ];
  };
}
