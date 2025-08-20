#!/usr/bin/env nix-shell
#! nix-shell -i fish --pure
#! nix-shell -p fish

if test -e $XDG_CONFIG_HOME/nvim/init.vim
  mv $XDG_CONFIG_HOME/nvim/init.vim $XDG_CONFIG_HOME/nvim/init.vim.old
end

ln -s -f $(path resolve init.lua) $XDG_CONFIG_HOME/nvim/init.lua
ln -s -f $(path resolve lua) $XDG_CONFIG_HOME/nvim/lua

set -xU VIM_CONFIG $(path resolve .)
