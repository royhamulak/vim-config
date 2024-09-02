return {
	lazy = {
		"akinsho/bufferline.nvim",
		{
			name = "bufferline",
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
		},
	},
	plugged = function()
		require("bufferline").setup({
			options = {
				indicator = {
					style = "underline",
				},
				numbers = "ordinal",
				-- diagnostics = "coc",
				color_icons = true,
				truncate_names = false,
			},
		})
	end,
}
