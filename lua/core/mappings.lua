----------------------------------------------------------------
-- General
----------------------------------------------------------------

-- Silent remap
local opt = {
  silent = true,
}

-- Map leader
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set ; to : in normal mode
vim.keymap.set('n', ';', ':', opt)

-- Reload config
vim.keymap.set('n', '<leader><cr>', _G.ReloadConfig, { silent = false })

-- Fast save
vim.keymap.set('n', '<leader>w', ':w!<cr>', opt)

----------------------------------------------------------------
-- Movement
----------------------------------------------------------------

-- Treat along lines asa break lines
vim.keymap.set('n', 'j', 'gj', opt)
vim.keymap.set('n', 'k', 'gk', opt)

-- Map <space> and <c-space> for easier search
vim.keymap.set('n', '<space>', '/', opt)
vim.keymap.set('n', '<C-space>', '?', opt)

-- Use <M-h/j/k/l> for movement in insert mode
vim.keymap.set('i', '<M-h>', '<Left>', opt)
vim.keymap.set('i', '<M-j>', '<Down>', opt)
vim.keymap.set('i', '<M-k>', '<Up>', opt)
vim.keymap.set('i', '<M-l>', '<Right>', opt)

-- Move between windows with <C-h/j//k/l>
vim.keymap.set('n', '<C-h>', '<C-w>h', opt)
vim.keymap.set('n', '<C-j>', '<C-w>j', opt)
vim.keymap.set('n', '<C-k>', '<C-w>k', opt)
vim.keymap.set('n', '<C-l>', '<C-w>l', opt)

-- <C-ESC> exists terminal mode
vim.keymap.set('t', '<C-ESC>', '<C-\\><C-n>', opt)

-- Enable switching from terminal with <C-h/j/k/l>
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', opt)
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', opt)
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', opt)
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', opt)

----------------------------------------------------------------
-- Buffers
----------------------------------------------------------------

-- Open new buffer with the current beffer's path
vim.keymap.set('n', '<leader>e', ':e <c-r>=expand("%:p:h")<cr>/', {silent = false})

-- Move to next buffer in the buffer list
vim.keymap.set('n', '<M-]>', ':bn<cr>', opt)

-- Move to previous buffer in the buffer list
vim.keymap.set('n', '<M-[>', ':bp<cr>', opt)

-- Close current buffer
vim.keymap.set('n', '<M-w>', ':bd<cr>', opt)

-- Close all other buffers
vim.keymap.set('n', '<M-S-w>', ':%bd|e#|bd#<cr>', opt)

-- Dynamic buffer switching based on number
vim.keymap.set('n', '<M-->', ':bf<cr>', opt)
vim.keymap.set('n', '<M-1>', ':bf<cr>:bn1<cr>', opt)
vim.keymap.set('n', '<M-2>', ':bf<cr>:bn2<cr>', opt)
vim.keymap.set('n', '<M-3>', ':bf<cr>:bn3<cr>', opt)
vim.keymap.set('n', '<M-4>', ':bf<cr>:bn4<cr>', opt)
vim.keymap.set('n', '<M-5>', ':bf<cr>:bn5<cr>', opt)
vim.keymap.set('n', '<M-6>', ':bf<cr>:bn6<cr>', opt)
vim.keymap.set('n', '<M-7>', ':bf<cr>:bn7<cr>', opt)
vim.keymap.set('n', '<M-8>', ':bf<cr>:bn8<cr>', opt)
vim.keymap.set('n', '<M-9>', ':bf<cr>:bn9<cr>', opt)
vim.keymap.set('n', '<M-=>', ':bl<cr>', opt)

----------------------------------------------------------------
-- Selection 
----------------------------------------------------------------

-- -- <C-A> is select all
-- vim.keymap.set('n', '<C-A>', 'gggH<C-O>G', opt)
-- vim.keymap.set('i', '<C-A>', '<C-O>gg<C-O>gH<C-O>G', opt)
-- vim.keymap.set({'c', 'o', 's'}, '<C-A>', '<C-O>gggH<C-O>G', opt)
-- vim.keymap.set('x', '<C-A>', '<C-C>ggVG', opt)

----------------------------------------------------------------
-- Search
----------------------------------------------------------------

-- Disable highlight on <cr>
vim.keymap.set('n', '<cr>', ':noh<cr>', opt)

-- Use * and # to search for visual selection
vim.keymap.set('v', '*', function () VisualSelection('f') end, opt)
vim.keymap.set('v', '#', function () VisualSelection('b') end, opt)

----------------------------------------------------------------
-- Utils
----------------------------------------------------------------

function VisualSelection(direction)
  local saved_reg = vim.fn.getreg('"')
  vim.cmd('execute "normal! vgvy"')

  local pattern = vim.fn.escape(vim.fn.getreg('"'), '\\/.*$^~[]')
  local pattern = vim.fn.substitute(pattern, '\n$', "", "")

  if direction == 'b' then
    vim.cmd('normal ?' .. pattern .. '^M')
  elseif direction =='gv' then
    vim.fn.feedkeys(':', 'vimgrep /' .. pattern .. '/ **/*.')
  elseif direction == 'replace' then
    vim.fn.feedkeys(':', '%s/' .. pattern .. '/')
  elseif direction == 'f' then
    vim.cmd('normal /' .. pattern .. '^M')
  end

  vim.fn.setreg('/', pattern)
  vim.fn.setreg('"', saved_reg)
end
