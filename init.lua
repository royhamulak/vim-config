local VIM_CONFIG = os.getenv("VIM_CONFIG") or (os.getenv("SUDO_HOME") .. "/.config/nvim")
vim.o.runtimepath = vim.o.runtimepath .. "," .. VIM_CONFIG
vim.cmd("source " .. VIM_CONFIG .. "/.vimrc")
--
-- Add VIM_CONFIG to runtimepath

-- require('lentent')
