#! /usr/local/bin/fish

set -l init init.lua

echo "vim.cmd('source $(path resolve $init)')" >> "$XDG_CONFIG_HOME/nvim/init.lua"

# ln -sf $(path resolve .vimrc) ~/.vimrc
