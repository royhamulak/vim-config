-- Enable filetype
vim.cmd('filetype on')

-- Enable filetype plugin
vim.cmd('filetype plugin on')

-- Enable filetype indent
vim.cmd('filetype indent on')

-- Set specifc filetypes
local specificFiletypes = vim.api.nvim_create_augroup('specificFiletypes', {clear=true})

vim.api.nvim_create_autocmd({
  'BufRead', 'BufEnter'
}, {
  pattern = '*.astro',
  group = specificFiletypes,
  command = 'set filetype=astro',
})

vim.api.nvim_create_autocmd({
  'BufRead', 'BufEnter'
}, {
  pattern = '*.mdx',
  group = specificFiletypes,
  command = 'set filetype=jsx',
})

vim.api.nvim_create_autocmd({
  'BufRead', 'BufEnter'
}, {
  pattern = '*.sql',
  group = specificFiletypes,
  command = 'set filetype=sql',
})

vim.api.nvim_create_autocmd({
  'BufRead', 'BufEnter'
}, {
  pattern = '*.md',
  group = specificFiletypes,
  command = 'set filetype=markdown',
})
