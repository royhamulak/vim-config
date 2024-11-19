return createButPlugConfig({
	"pwntester/octo.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		-- OR 'ibhagwan/fzf-lua',
		"nvim-tree/nvim-web-devicons",
	},
	priority = 10000,
	cmd = "Octo",
	config = function()
		require("octo").setup({
			default_merge_method = "squash",
			-- reviews = {
			-- 	auto_show_threads = false, -- automatically show comment threads on cursor move
			-- },
		})
	end,
})
