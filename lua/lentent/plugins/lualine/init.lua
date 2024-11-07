return createButPlugConfig({
	"nvim-lualine/lualine.nvim",
	dependencies = { "ecthelionvi/NeoComposer.nvim", "gennaro-tedesco/nvim-possession", "folke/noice.nvim" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					"filename",
					-- "g:coc_status"
					-- {
					-- 	function()
					-- 		return require("nvim-possession").status()
					-- 	end,
					-- 	cond = function()
					-- 		return require("nvim-possession").status() ~= nil
					-- 	end,
					-- },
					{
						function()
							return require("NeoComposer.ui").status_recording()
						end,
					},
				},
				lualine_x = {
					{
						require("noice").api.status.message.get_hl,
						cond = require("noice").api.status.message.has,
					},
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.search.get,
						cond = require("noice").api.status.search.has,
						color = { fg = "#ff9e64" },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "searchcount", "selectioncount", "progress" },
				lualine_z = { "location" },
			},
			-- tabline = {
			--   lualine_a = {
			--     {
			--       'buffers',
			--       mode = 2,
			--       use_mode_colors = true,
			--       symbols = {
			--         modified = ' +',      -- Text to show when the buffer is modified
			--         alternate_file = '#', -- Text to show to identify the alternate file
			--         directory =  '',     -- Text to show when the buffer is a directory
			--       },
			--     }
			--   },
			--   lualine_b = {},
			--   lualine_c = {},
			--   lualine_x = {},
			--   lualine_y = {},
			--   lualine_z = {'tabs'}
			-- }
		})
	end,
})
-- 	lazy = {
-- 		"nvim-lualine/lualine.nvim",
-- 		{
-- 			name = "lualine",
-- 			opts = {
-- 				sections = {
-- 					lualine_a = { "mode" },
-- 					lualine_b = { "branch", "diff", "diagnostics" },
-- 					lualine_c = {
-- 						"filename",
-- 						-- "g:coc_status"
-- 					},
-- 					lualine_x = { "encoding", "fileformat", "filetype" },
-- 					lualine_y = { "progress" },
-- 					lualine_z = { "location" },
-- 				},
-- 				-- tabline = {
-- 				--   lualine_a = {
-- 				--     {
-- 				--       'buffers',
-- 				--       mode = 2,
-- 				--       use_mode_colors = true,
-- 				--       symbols = {
-- 				--         modified = ' +',      -- Text to show when the buffer is modified
-- 				--         alternate_file = '#', -- Text to show to identify the alternate file
-- 				--         directory =  '',     -- Text to show when the buffer is a directory
-- 				--       },
-- 				--     }
-- 				--   },
-- 				--   lualine_b = {},
-- 				--   lualine_c = {},
-- 				--   lualine_x = {},
-- 				--   lualine_y = {},
-- 				--   lualine_z = {'tabs'}
-- 				-- }
-- 			},
-- 		},
-- 	},
-- }
