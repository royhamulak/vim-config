require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "+" },
	},
	signcolumn = true,
	numhl = true,
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 100,
	},
})
