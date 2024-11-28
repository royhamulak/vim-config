return {
	require("lentent.plugins.fzf"),
	require("lentent.plugins.fzf-nvim"),
	require("lentent.plugins.illuminate"),
	createButPlugConfig({ "nvim-lua/plenary.nvim", priority = 10000 }),
	createButPlugConfig({ "antoinemadec/FixCursorHold.nvim" }),
	createButPlugConfig({ "tpope/vim-surround" }),
	createButPlugConfig({ "tomtom/tcomment_vim" }),
	createButPlugConfig({ "iamcco/markdown-preview.nvim", build = "cd app && npx --yes yarn install" }),
	createButPlugConfig({ "tpope/vim-fugitive" }),
	createButPlugConfig({ "sindrets/diffview.nvim" }),
	-- createButPlugConfig({ "neoclide/npm.nvim", build = "npm install", dependencies = "Shougo/denite.nvim" }),
	createButPlugConfig({ "nvimtools/none-ls.nvim" }),
	createButPlugConfig({ "nvimtools/none-ls-extras.nvim" }),
	createButPlugConfig({ "zeioth/none-ls-autoload.nvim" }),
	createButPlugConfig({
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ensure_installed = {
					"cspell",
					--"codespell",
					"vtsls",
					"eslint-lsp",
					"prettier",
					"stylua",
				},
			})
		end,
		priority = 999,
	}),
	createButPlugConfig({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
		end,
	}),
	createButPlugConfig({ "neovim/nvim-lspconfig" }),
	createButPlugConfig({ "davidmh/cspell.nvim" }),
	createButPlugConfig({
		"kkoomen/vim-doge",
		build = function()
			vim.fn["doge#install"]()
		end,
	}),
	createButPlugConfig({ "yioneko/nvim-vtsls" }),
	createButPlugConfig({
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp")
		end,
	}),
	createButPlugConfig({ "hrsh7th/cmp-nvim-lsp" }),
	createButPlugConfig({ "hrsh7th/cmp-buffer" }),
	createButPlugConfig({ "hrsh7th/cmp-path" }),
	createButPlugConfig({ "hrsh7th/cmp-cmdline" }),
	createButPlugConfig({ "hrsh7th/cmp-nvim-lsp-signature-help" }),
	createButPlugConfig({ "SergioRibera/cmp-dotenv" }),
	createButPlugConfig({ "gbrlsnchs/telescope-lsp-handlers.nvim" }),
	createButPlugConfig({ "MunifTanjim/nui.nvim" }),
	createButPlugConfig({ "stevearc/dressing.nvim" }),
	createButPlugConfig({ "Bilal2453/luvit-meta" }),
	createButPlugConfig({ "dmmulroy/ts-error-translator.nvim" }),
	require("lentent.plugins.lspsaga"),
	createButPlugConfig({
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	}),
	-- require("lentent.plugins.regex-railroad"),
	-- require("lentent.plugins.mini.indentscope"),
	require("lentent.plugins.neoconf"),
	require("lentent.plugins.lazydev"),
	require("lentent.plugins.nvim-web-devicons"),
	require("lentent.plugins.bufferline"),
	-- require("lentent.plugins.posessions"),
	require("lentent.plugins.lualine"),
	require("lentent.plugins.onedark"),
	require("lentent.plugins.colorizer"),
	require("lentent.plugins.treesitter"),
	require("lentent.plugins.treesitter.syntax-tree-surfer"),
	-- require("lentent.plugins.treesitter.textobjects"),
	require("lentent.plugins.gitsigns"),
	require("lentent.plugins.nvim-tree"),
	require("lentent.plugins.notify"),
	require("lentent.plugins.nvim-test"),
	require("lentent.plugins.textcase"),
	require("lentent.plugins.arrow"),
	require("lentent.plugins.telescope"),
	require("lentent.plugins.noice"),
	-- require("lentent.plugins.lspsaga"),
	require("lentent.plugins.precognition"),
	require("lentent.plugins.ufo"),
	require("lentent.plugins.attempt"),
	-- require("lentent.plugins.neo-composer"),
	createButPlugConfig({ "dmmulroy/ts-error-translator.nvim" }),
	createButPlugConfig({
		"OXY2DEV/helpview.nvim",
		lazy = false, -- Recommended
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	}),
	createButPlugConfig({
		"danymat/neogen",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	}),
	createButPlugConfig({
		"LunarVim/bigfile.nvim",
		config = function()
			require("bigfile").setup({})
		end,
	}),
	createButPlugConfig({
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	}),
	require("lentent.plugins.octo"),
  createButPlugConfig({
    "ndonfris/fish-lsp",
    build = "yarn install",
  })
}
