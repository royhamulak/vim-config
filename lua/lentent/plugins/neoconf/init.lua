return {
	lazy = { "folke/neoconf.nvim", { name = "neoconf", priority = 1000, opts = {} } },
	plugged = function()
		require("neoconf").setup({})
	end,
}
