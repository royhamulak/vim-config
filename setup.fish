#! /usr/local/bin/fish
set -l init init.lua

if test -e $XDG_CONFIG_HOME/init.lua
  mv $XDG_CONFIG_HOME/init.lua $XDG_CONFIG_HOME/init.lua.old
end

if test -e $XDG_CONFIG_HOME/init.vim
  mv $XDG_CONFIG_HOME/init.vim $XDG_CONFIG_HOME/init.vim.old
end

echo "vim.cmd('source $(path resolve $init)')" >> "$XDG_CONFIG_HOME/nvim/init.lua"
