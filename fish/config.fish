if status is-interactive
and not set -q TMUX
  exec tmux
end

fish_vi_key_bindings
