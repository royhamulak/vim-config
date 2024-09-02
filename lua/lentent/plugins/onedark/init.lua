local config = {
	style = "warmer",
	transparent = true,
	highlights = {
		["@type"] = { fg = "$red" },
		["@variable.parameter"] = { fg = "$yellow" },
	},
}

return {
	lazy = {
		"navarasu/onedark.nvim",
		priority = 1000,
		init = function()
			require("onedark").setup(config)
			require("onedark").load()
			-- vim.cmd('colorscheme onedark')
		end,
	},
	plugged = function()
		require("onedark").setup(config)
		require("onedark").load()
	end,
}
