-- Make cli 1 line
vim.o.cmdheight = 1

-- Show incomplete commands
vim.o.showcmd = true

-------------------------------------
-- Wild menu - cli autocomplete
-------------------------------------

-- Enable auto complete in vim cli
vim.o.wildmenu = true

-- Ignore files in autocomplete
vim.o.wildignore = "*.o,*~,*.pyc,*/.git/*,*/.DS_Store,*.d.ts.map"
