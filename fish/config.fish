if status is-interactive
and not set -q TMUX
  exec tmux
  fenv source ~/.profile
end

fish_vi_key_bindings
