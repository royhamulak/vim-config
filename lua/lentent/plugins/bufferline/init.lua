return createButPlugConfig({
	"akinsho/bufferline.nvim",
	opts = {

		options = {
			indicator = {
				style = "underline",
			},
			numbers = "ordinal",
			-- diagnostics = "coc",
			color_icons = true,
			truncate_names = false,
		},
	},
})
