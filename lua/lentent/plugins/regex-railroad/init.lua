local colors = require("lentent.plugins.onedark.colors")

require("regex-railroad").setup({
	--- Github release of plugin
	tag = "v0.0.1",
	--- Highlight group used in :RegexText
	highlight = {
		bold = true,
		fg = colors.fg,
		bg = colors.bg0,
	},
})

vim.api.nvim_set_keymap("n", "<leader>re", "<cmd>RegexText<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>RegexRailroad<CR>", { noremap = true, silent = true })
