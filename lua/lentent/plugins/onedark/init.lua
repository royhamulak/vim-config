local config = {
	style = "warmer",
	transparent = true,
	-- highlights = {
	-- 	["@type"] = { fg = "$red" },
	-- 	["@variable.parameter"] = { fg = "$yellow" },
	-- },
}

return createButPlugConfig({
	"navarasu/onedark.nvim",
	-- priority = ,
	init = function()
		require("onedark").setup(config)
		require("onedark").load()
		vim.cmd("colorscheme onedark")
	end,
})
