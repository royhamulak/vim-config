return createButPlugConfig({
	"nvim-tree/nvim-web-devicons",
	init = function()
		require("nvim-web-devicons").setup()
	end,
  priority = 1,
})
