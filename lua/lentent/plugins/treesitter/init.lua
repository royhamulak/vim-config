return createButPlugConfig({
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	init = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"typescript",
				"json",
				"javascript",
				"yaml",
				"jsonc",
				"html",
				"vim",
				"vimdoc",
				"lua",
				"css",
				"bash",
				"csv",
				"dockerfile",
				"elm",
				"fish",
				"markdown",
				"astro",
				"sql",
				"regex",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
			incremental_selection = {
				enable = false,
				-- keymaps = {
				--   init_selection = "<leader>s",
				--   node_incremental = "s",
				--   scope_incremental = "S",
				--   node_decremental = "d",
				-- }
			},
		})

		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
	end,
})
