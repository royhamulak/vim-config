-- Enable file title
vim.o.title = true

-- Enable mouse
vim.o.mouse = 'a'

-- Regex memory limit
vim.o.maxmempattern = 100000

-- Lower swap file update time
vim.o.updatetime = 300

-- Don't pass messages to inx-completion-menu
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Split window to the right
vim.o.splitright = true

-- Autoreload on external filechange
vim.o.autoread = true
vim.api.nvim_create_autocmd({
  'FocusGained',
  'BufEnter'
}, {
  pattern = '*',
  command = 'checktime'
})

require('core.UI')
require('core.mappings')
require('core.undo')
require('core.history')
require('core.filetype')
