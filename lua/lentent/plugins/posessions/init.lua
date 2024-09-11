return createButPlugConfig({
	"gennaro-tedesco/nvim-possession",
	dependencies = {
		"ibhagwan/fzf-lua",
	},
	config = true,
  priority = 100,
	init = function()
		local sessionsPath = vim.fn.stdpath("data") .. "/sessions"
		if not (vim.uv or vim.loop).fs_stat(sessionsPath) then
			vim.cmd("! mkdir " .. sessionsPath)
		end

		local possession = require("nvim-possession")
		possession.setup({
			autoload = true,
			autoswitch = {
				enable = true,
			},
		})
		vim.keymap.set("n", "<leader>sl", function()
			possession.list()
		end)
		vim.keymap.set("n", "<leader>sn", function()
			possession.new()
		end)
		vim.keymap.set("n", "<leader>su", function()
			possession.update()
		end)
		vim.keymap.set("n", "<leader>sd", function()
			possession.delete()
		end)
	end,
})
