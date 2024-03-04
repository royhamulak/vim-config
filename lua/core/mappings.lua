-- Map leader
vim.o.mapleader = ','
vim.g.mapleader = ','

-- Silent remap
local opt = {
  silent = true,
}

-- Set ; to : in normal mode
vim.keymap.set('n', ';', ':', opt)

-- Fast save
vim.keymap.set('n', '<leader>w', ':w!<cr>', opt)

-- <C-ESC> exists terminal mode
vim.keymap.set('t', '<C-ESC>', '<C-\\><C-n>', opt)

-- Enable switching from terminal with <C-h/j/k/l>
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', opt)
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', opt)
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', opt)
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', opt)


