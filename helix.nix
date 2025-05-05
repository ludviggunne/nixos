{
  pkgs,
}:

{
  enable = true;
  settings = {
    # theme = "monochrome";
    theme = "${import ./theme.nix}";
    editor = {
      line-number = "relative";
      mouse = false;
      statusline.center = [ "version-control" ];
      smart-tab.enable = false;
      auto-completion = false;
      lsp.auto-signature-help = false;
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
    language = [
      {
        name = "faust";
        grammar = "faust";
        scope = "source.dsp";
        file-types = [ "dsp" ];
      }
    ];

    grammar = [
      {
        name = "faust";
        source = {
          git = "https://github.com/khiner/tree-sitter-faust";
          rev = "f3b9274514b5f9bf6b0dd4a01c30f9cc15c58bc4";
        };
      }
    ];
  };
}
