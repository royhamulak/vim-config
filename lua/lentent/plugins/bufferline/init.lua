-- require("bufferline").setup({
-- 	options = {
-- 		indicator = {
-- 			style = "underline",
-- 		},
-- 		numbers = "ordinal",
-- 		-- diagnostics = "coc",
-- 		color_icons = true,
-- 		truncate_names = false,
-- 	},
-- })
--
return {
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
}
