{ config, pkgs, ... }: {

  programs.fzf.tmux = {
    enableShellIntegration = true;
    shellIntegrationOptions = [ "-d 35%" ];
  };
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
    historyLimit = 5000;
    aggressiveResize = true;
    keyMode = "vi";
    reverseSplit = true;
    terminal = "screen-256color";
    plugins = [
      { plugin = pkgs.tmuxPlugins.fpp; }
      { plugin = pkgs.tmuxPlugins.vim-tmux-navigator; }
      {
        plugin = pkgs.tmuxPlugins.fingers;
        extraConfig = ''
          set -g @fingers-patterns-0 'arn:aws:\S*'
          set -g @fingers-patterns-1 'sha256:\S*'
          set -g @fingers-keyboard-layout "colemak"
        '';
      }
      { plugin = pkgs.tmuxPlugins.extrakto; }
      { plugin = pkgs.tmuxPlugins.jump; }

    ];
    extraConfig = ''
      bind-key o copy-mode
      # Setup 'v' to begin selection as in Vim
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
      #https://www.reddit.com/r/tmux/comments/8car73/is_it_possible_to_have_prefixless_and_pager/
      bind-key -n PPage if -F '#{alternate_on}' 'send-keys PPage' 'copy-mode -eu'
      set-option -g set-titles on
      set-option -g set-titles-string '#T'
      set -g status off
      setw -g mouse on
      bind e run-shell -b "tmux-editbuffer.sh"
      setw -g monitor-activity on
      set -g visual-activity on
      # for 24 bit tru color this needs to match $TERM when not running tmux
      set -ga terminal-overrides ",alacritty:Tc"
    '';
  };
}
