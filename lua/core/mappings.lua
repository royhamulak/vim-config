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

-- Open new buffer with the current beffer's path
vim.keymap.set('n', '<leader>e', ':e <c-r>=expand("%:p:h")<cr>/', opt)


-- Move between buffers with <C-h/j//k/l>
vim.keymap.set('n', '<C-h>', '<C-w>h', opt)
vim.keymap.set('n', '<C-j>', '<C-w>j', opt)
vim.keymap.set('n', '<C-k>', '<C-w>k', opt)
vim.keymap.set('n', '<C-l>', '<C-w>l', opt)

-- <C-A> is select all
vim.keymap.set('n', '<C-A>', 'gggH<C-O>G', opt)
vim.keymap.set('i', '<C-A>', '<C-O>gg<C-O>gH<C-O>G', opt)
vim.keymap.set({'c', 'o', 's'}, '<C-A>', '<C-O>gggH<C-O>G', opt)
vim.keymap.set('x', '<C-A>', '<C-C>ggVG', opt)

-- Reload config
vim.keymap.set("n", "<leader><CR>", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })
--------------------------------
-- Utils
--------------------------------

vim.api.nvim_create_user_command('VisualSelection', function(opts)
  
end, {})