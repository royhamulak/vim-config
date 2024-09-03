return createButPlugConfig({
	"otavioschwanck/arrow.nvim",
	init = function()
		require("arrow").setup({
			always_show_path = true,
			show_icons = true,
			leader_key = "\\",
		})
	end,
})
