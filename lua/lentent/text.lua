-- Use spaces instead of tabs
vim.o.expandtab = true

-- Match inserted <TAB> spacing
vim.o.smarttab = true

-- Number of spaces per <TAB>
vim.o.shiftwidth = 2

-- Represent <TAB> in file as the shiftwidth val
vim.o.tabstop = vim.o.shiftwidth

-- Enable linebreak on long lines
vim.o.linebreak = true

-- Maximm text width
vim.o.textwidth = 500

-- Enable auto indent
vim.o.autoindent = true

-- Enable smart indenting
vim.o.smartindent = true

-- Enable wrap lines 
vim.o.wrap = true

-- Set unnamed register to "*"
vim.o.clipboard = 'unnamed'
