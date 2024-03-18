-- Save undo history to file
vim.o.undofile = true

-- Max number of undos saved
vim.o.undolevels = 1000

-- Save whole buffer to undo when reloading file
vim.o.undoreload = 100000

-- Disable swap file
vim.o.swapfile = false

-- Disable backup
vim.o.backup = false

-- Disable temp backup on saving
vim.o.writebackup = false

-- Return to last edit position when opening a file
vim.api.nvim_create_autocmd({'BufReadPost'}, {
  pattern = {'*'},
  command = [[
    if line("'\"") > 0 && line("'\"") <= line("$") |
      exe "normal! g`\"" |
    endif
  ]]
})

-- Remember buffer list when exiting vim
vim.o.shada = '%,' .. vim.o.shada

-- When switiching buffers use open windows, otherwise split window
vim.o.switchbuf = 'useopen,vsplit'
