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

require('core.cli')
require('core.colors')
require('core.UI')
require('core.text')
require('core.mappings')
require('core.files')
require('core.history')
require('core.filetype')
require('core.history')
