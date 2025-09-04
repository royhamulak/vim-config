vim.o.runtimepath = vim.o.runtimepath .. ',' .. os.getenv('VIM_CONFIG')
vim.cmd("source $VIM_CONFIG/.vimrc")
--
-- Add VIM_CONFIG to runtimepath

-- require('lentent')
