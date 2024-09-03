return createButPlugConfig({
	"folke/neoconf.nvim",
	-- lazy = { "folke/neoconf.nvim", { name = "neoconf", priority = 1000, opts = {} } },
  init = function()
		require("neoconf").setup({})
	end,
	priority = 51,
})
