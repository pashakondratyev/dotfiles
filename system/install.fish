#!/usr/bin/env fish
abbr -a less 'less -r'

if command -qs zoxide
	zoxide init fish >$__fish_config_dir/conf.d/zoxide.fish
end
