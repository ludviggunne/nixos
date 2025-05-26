{
  enable = true;
  extraConfig = ''
    set -g prefix C-e
    set -s escape-time 0

    bind C-e send-prefix
    bind n split-window -hc "#{pane_current_path}"
    bind s split-window -vc "#{pane_current_path}"
    bind d kill-pane
    bind q kill-window
    bind End kill-session
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R
    bind Enter new-window
    bind '-' detach-client

    set -g default-terminal "tmux-256color"

    set -g base-index 1
    setw -g pane-base-index 1
    set -g mouse on 
  '';
}
