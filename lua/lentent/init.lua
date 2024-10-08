-- Enable file title
vim.o.title = true

-- Enable mouse
vim.o.mouse = 'a'

-- Regex memory limit
vim.o.maxmempattern = 100000

-- Lower swap file update time
vim.o.updatetime = 300

-- Wait time for mapped sequence to complete
vim.o.timeoutlen = 500

-- Don't pass messages to inx-completion-menu
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Autoreload on external filechange
vim.o.autoread = true
vim.api.nvim_create_autocmd({
  'FocusGained',
  'BufEnter'
}, {
  pattern = '*',
  command = 'checktime'
})


-- Make buffers hidden when abandoned
vim.o.hidden = true

-- Make backspace act as expected
vim.o.backspace = 'eol,start,indent'

-- Allow l and h to move to next/previous lines
vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l'

-- Disable bell for error messages
vim.o.errorbells = false

-- Disable visual bell for errors
vim.o.visualbell = false

-- Set default encoding to utf8 for intenral vim communication
vim.o.encoding = 'utf8'

-- Use Unix EOL format when editing or readong a file
vim.o.fileformats = 'unix,dos,mac'

---------------------------------------------
-- Utils
---------------------------------------------

-- Delete trailing white space on save
function ClearExtraSpaces()
  local save_cursor = vim.fn.getpos('.')
  local old_q = vim.fn.getreg('/')
  vim.cmd('silent! a%s/\\s\\+$//e')
  vim.fn.setpos('.', save_cursor)
  vim.fn.setreg('/', old_q)
end

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.txt", "*.js", "*.ts", "*.sh", "*.fishrc", "*.lua"},
  callback = ClearExtraSpaces
})


require('lentent.cli')
require('lentent.reload')
require('lentent.colors')
require('lentent.UI')
require('lentent.text')
require('lentent.mappings')
require('lentent.files')
require('lentent.history')
require('lentent.filetype')
require('lentent.search')
require('lentent.plugins')
