require("lualine").setup({
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			"filename",
			-- "g:coc_status"
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
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