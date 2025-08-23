return createButPlugConfig({
	"gennaro-tedesco/nvim-possession",
	dependencies = {
		"ibhagwan/fzf-lua",
	},
	priority = 1,
	config = function()
		local possession = require("nvim-possession")
		possession.setup({
			autoload = true,
			autoswitch = {
				enable = true,
			},
			fzf_winopts = {
				height = 0.45,
				width = 0.45,
			},
			-- save_hook = function()
			--   local windows = vim.api.nvim_list_wins()
			--   vim.print("windows" .. vim.inspect(windows))
			--   for _, win in ipairs(windows) do
			--     local vb = vim.api.nvim_win_get_buf(win)
			--     vim.print(vim.inspect(win) .. " buf " .. vim.inspect(vb) .. vim.api.nvim_buf_get_name(vb))
			--     vim.print(vim.api.nvim_buf_get_name(vb) ~= '')
			--   end
			-- end,
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
	-- config = true
	init = function()
		local sessionsPath = vim.fn.stdpath("data") .. "/sessions"
		if not (vim.uv or vim.loop).fs_stat(sessionsPath) then
			vim.cmd("! mkdir " .. sessionsPath)
		end
	end,
})
