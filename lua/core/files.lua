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
