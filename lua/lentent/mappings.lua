----------------------------------------------------------------
-- General
----------------------------------------------------------------

-- Map leader

-- Set ; to : in normal mode
vim.keymap.set("n", ";", ":", _G.keymap_opt.no_remap)

-- Fast save
vim.keymap.set("n", "<leader>w", ":w!<cr>", _G.keymap_opt.silent)

-- Switch CWD to the buffer's directory
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>", _G.keymap_opt.silent)

----------------------------------------------------------------
-- Editing
----------------------------------------------------------------

-- Remap 0 to first non-blank character
vim.keymap.set("n", "0", "^", _G.keymap_opt.silent)

-- Move lines using <M-jk>
vim.keymap.set("n", "<M-j>", "mz:m+<cr>`z", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-k>", "mz:m-2<cr>`z", _G.keymap_opt.silent)
vim.keymap.set("v", "<M-j>", ":m'>+<cr>`<my`>mzgv`yo`z", _G.keymap_opt.silent)
vim.keymap.set("v", "<M-k>", ":m'<-2<cr>`>my`<mzgv`yo`z", _G.keymap_opt.silent)

-- Quickly replace selected text in visual selection
vim.keymap.set("v", "<leader>r", function()
  VisualSelection("replace")
end, {})

----------------------------------------------------------------
-- Movement
----------------------------------------------------------------

-- Treat along lines asa break lines
vim.keymap.set("n", "j", "gj", _G.keymap_opt.silent)
vim.keymap.set("n", "k", "gk", _G.keymap_opt.silent)

-- Map <space> and <c-space> for easier search
vim.keymap.set("n", "<space>", "/", _G.keymap_opt.silent)
vim.keymap.set("n", "<C-space>", "?", _G.keymap_opt.silent)

-- Use <M-h/j/k/l> for movement in insert mode
vim.keymap.set("i", "<M-h>", "<Left>", _G.keymap_opt.silent)
vim.keymap.set("i", "<M-j>", "<Down>", _G.keymap_opt.silent)
vim.keymap.set("i", "<M-k>", "<Up>", _G.keymap_opt.silent)
vim.keymap.set("i", "<M-l>", "<Right>", _G.keymap_opt.silent)

-- Move between windows with <C-h/j//k/l>
vim.keymap.set("n", "<C-h>", "<C-w>h", _G.keymap_opt.silent)
vim.keymap.set("n", "<C-j>", "<C-w>j", _G.keymap_opt.silent)
vim.keymap.set("n", "<C-k>", "<C-w>k", _G.keymap_opt.silent)
vim.keymap.set("n", "<C-l>", "<C-w>l", _G.keymap_opt.silent)

-- <C-ESC> exists terminal mode
vim.keymap.set("t", "<C-ESC>", "<C-\\><C-n>", _G.keymap_opt.silent)

-- Enable switching from terminal with <C-h/j/k/l>
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", _G.keymap_opt.silent)
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", _G.keymap_opt.silent)
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", _G.keymap_opt.silent)
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", _G.keymap_opt.silent)

----------------------------------------------------------------
-- Buffers
----------------------------------------------------------------

-- Open new buffer with the current beffer's path
vim.keymap.set("n", "<leader>e", ':e <c-r>=expand("%:p:h")<cr>/', { silent = false })

-- Move to next buffer in the buffer list
vim.keymap.set("n", "<M-]>", ":bn<cr>", _G.keymap_opt.silent)

-- Move to previous buffer in the buffer list
vim.keymap.set("n", "<M-[>", ":bp<cr>", _G.keymap_opt.silent)

-- Close current buffer
vim.keymap.set("n", "<M-w>", ":bd<cr>", _G.keymap_opt.silent)

-- Close all other buffers
vim.keymap.set("n", "<M-S-w>", ":%bd|e#|bd#<cr>", _G.keymap_opt.silent)

-- Dynamic buffer switching based on number
vim.keymap.set("n", "<M-->", ":bf<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-1>", ":bf<cr>:bn1<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-2>", ":bf<cr>:bn2<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-3>", ":bf<cr>:bn3<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-4>", ":bf<cr>:bn4<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-5>", ":bf<cr>:bn5<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-6>", ":bf<cr>:bn6<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-7>", ":bf<cr>:bn7<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-8>", ":bf<cr>:bn8<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-9>", ":bf<cr>:bn9<cr>", _G.keymap_opt.silent)
vim.keymap.set("n", "<M-=>", ":bl<cr>", _G.keymap_opt.silent)

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
vim.keymap.set("n", "<cr>", ":noh<cr>", _G.keymap_opt.silent)

-- Use * and # to search for visual selection
vim.keymap.set("v", "*", function()
  return VisualSelection("f")
end, {})
vim.keymap.set("v", "#", function()
  return VisualSelection("b")
end, {})

-- Use <Space> to search and <C-Space> to backwards search
vim.keymap.set("n", "<Space>", "/", {})
vim.keymap.set("n", "<C-Space>", "?", {})

----------------------------------------------------------------
-- Utils
----------------------------------------------------------------

function VisualSelection(direction)
  local saved_reg = vim.fn.getreg('"')
  vim.cmd('execute "normal! vgvy"')

  local pattern = vim.fn.escape(vim.fn.getreg('"'), "\\/.*$^~[]")
  local pattern = vim.fn.substitute(pattern, "\n$", "", "")
  print(pattern)

  if direction == "b" then
    vim.cmd.normal("?" .. pattern .. "^M")
  elseif direction == "gv" then
    vim.fn.feedkeys(":vimgrep /" .. pattern .. "/ **/*.")
  elseif direction == "replace" then
    vim.fn.feedkeys(":%s/" .. pattern .. "/")
  elseif direction == "f" then
    vim.cmd.normal("/" .. pattern .. "^M")
  end

  vim.fn.setreg("/", pattern)
  vim.fn.setreg('"', saved_reg)
end
