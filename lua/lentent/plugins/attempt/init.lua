return createButPlugConfig({
	"m-demare/attempt.nvim", -- No need to specify plenary as dependency
	opts = {
		ext_options = { "lua", "ts", "sql", "js", "fish", "json", "yaml", "" },
		format_opts = { [""] = "[None]" },
		run = {
			js = { "w !node" },
			ts = { "w !deno run -" },
			lua = { "w", "luafile %" },
			sh = { "w !bash" },
			fish = { "w !fish %" },
		},
	},
	config = function(p)
		local attempt = require("attempt")
		attempt.setup(p.opts)

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts = vim.tbl_extend("force", { silent = true }, opts)
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "<leader>an", attempt.new_select) -- new attempt, selecting extension
		map("n", "<leader>al", ":Telescope attempt<cr>") -- search through attempts
		map("n", "<leader>ar", attempt.run) -- run attempt
		map("n", "<leader>arn", attempt.rename_buf) -- rename attempt from current buffer
		--or: map('n', '<leader>al', attempt.open_select) -- use ui.select instead of telescope
	end,
})
