-- Ignore case in search
vim.o.ignorecase = true

-- If case provided, enforce it
vim.o.smartcase = true

-- Highlight search results
vim.o.hlsearch = true

-- Hightlight search results while typing
vim.o.incsearch = true

-- Enable regex in search
vim.o.magic = true

-- Use Silver searcher if available
if vim.fn.executable("ag") == 1 then
	vim.o.grepprg = "ag --nogroup --nocolor"
end
