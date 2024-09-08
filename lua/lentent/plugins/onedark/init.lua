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
	priority = 10000,
	config = function()
		require("onedark").setup(config)
		require("onedark").load()
	end,
})
