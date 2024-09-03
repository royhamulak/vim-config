return createButPlugConfig({
	"folke/lazydev.nvim",
	init = function()
		require("lazydev").setup({
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				"~/my-stuff/vim-config",
				"~/local/share/nvim/nvim-plugins",
				"luvit-meta/library",
			},
		})
		-- require("cmp").
	end,
	priority = 51,
	-- lazy = {
	-- 	{
	-- 		"folke/lazydev.nvim",
	-- 		ft = "lua", -- only load on lua files
	-- 		opts = {
	-- 			library = {
	--
	-- 				"~/my-stuff/vim-config",
	-- 				"~/local/share/nvim/plugged",
	-- 				"luvit-meta/library",
	-- 				-- See the configuration section for more details
	-- 				-- Load luvit types when the `vim.uv` word is found
	-- 				{ path = "luvit-meta/library", words = { "vim%.uv" } },
	-- 			},
	-- 		},
	-- 		name = "lazydev",
	-- 	},
	-- 	{ -- optional completion source for require statements and module annotations
	-- 		"hrsh7th/nvim-cmp",
	-- 		opts = function(_, opts)
	-- 			opts.sources = opts.sources or {}
	-- 			table.insert(opts.sources, {
	-- 				name = "lazydev",
	-- 				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
	-- 			})
	-- 		end,
	-- 	},
	-- 	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
	-- },
})
