#!/usr/bin/env fish
if ! command -qs tmux
	exit
end

#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

abbr -a ta 'tmux a'

