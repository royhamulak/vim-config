return {
	lazy = { "nvim-tree/nvim-web-devicons", { name = "nvim-web-devicons" } },
	plugged = function()
		require("nvim-web-devicons").setup()
	end,
}
