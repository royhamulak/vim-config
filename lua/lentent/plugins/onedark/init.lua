local config = {
	style = "warmer",
	transparent = true,
	highlights = {
		["@type"] = { fg = "$red" },
		["@variable.parameter"] = { fg = "$yellow" },
	},
}

require("onedark").setup(config)
require("onedark").load()

return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup(config)
		require("onedark").load()
		-- vim.cmd('colorscheme onedark')
	end,
}
