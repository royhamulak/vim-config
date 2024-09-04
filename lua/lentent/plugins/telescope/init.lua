return createButPlugConfig({
	"nvim-telescope/telescope.nvim",
	init = function()
		local opts = { noremap = true, silent = true }
		local telescope = require("telescope")
		-- local telescopeThemes = require("telescope.themes")

		telescope.setup({
			defaults = {
				dynamic_preview_title = true,
				initial_mode = "normal",
			},
			pickers = {
				git_files = {
					use_git_root = false,
					initial_mode = "insert",
				},
				live_grep = {
					initial_mode = "insert",
				},
				find_files = {
					initial_mode = "insert",
				},
			},
		})

		telescope.load_extension("lsp_handlers")
		local tele_builtins = require("telescope.builtin")

		vim.keymap.set("n", "<C-F>", "<cmd>Telescope live_grep<cr>", opts)
		vim.keymap.set("n", "<C-P>", function()
			if os.execute("git rev-parse --show-top-level 2> /dev/null") == 0 then
				tele_builtins.git_files({ show_untracked = true })
			else
				tele_builtins.find_files()
			end
		end, opts)
	end,
	priority = 51,
})
