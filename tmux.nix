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

    # setw -g clock-mode-colour yellow
    # setw -g mode-style "fg=gray bg=gray bold"
    # set -g pane-border-style "fg=gray"
    # set -g pane-active-border-style "fg=yellow"
    # set -g status-position bottom
    # set -g status-justify left
    # set -g status-style "fg=gray"
    # set -g status-left ""
    # set -g status-left-length 10
    # set -g status-right-style "fg=black bg=gray"
    # set -g status-right "%Y-%m-%d %H:%M "
    # set -g status-right-length 50
    # setw -g window-status-current-style "fg=gray bg=black"
    # setw -g window-status-style "fg=gray bg=black"

    # set-option -ga terminal-overrides ",xterm-256color:Tc"
    # set -g default-terminal "xterm-256color"
    set -g default-terminal "tmux-256color"

    set -g base-index 1
    setw -g pane-base-index 1
    set -g mouse on 
  '';
}
