-- local plugins = require("lentent.plugins")

local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")
-- " Core Stuff
Plug("junegunn/fzf", {
	["do"] = function()
		vim.fn["fzf#install"]()
	end,
})
Plug("junegunn/fzf.vim")
Plug("RRethy/vim-illuminate")

Plug("nvim-tree/nvim-web-devicons")
-- " Plug('ryanoasis/vim-devicons')

Plug("nvim-lualine/lualine.nvim")
Plug("akinsho/bufferline.nvim", { tag = "*" })

Plug("nvim-lua/plenary.nvim")
Plug("antoinemadec/FixCursorHold.nvim")
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.x" })

Plug("rcarriga/nvim-notify")
-- """"""""""""""""""""""""""""""""""""""""

-- " General
Plug("tpope/vim-surround")
Plug("norcalli/nvim-colorizer.lua")
Plug("tomtom/tcomment_vim")

-- " Mini,nvim
Plug("echasnovski/mini.indentscope")

-- """"" File tree plugin
Plug("nvim-tree/nvim-tree.lua")
-- " Plug('scrooloose/nerdtree')
-- " Plug('Xuyuanp/nerdtree-git-plugin')
-- """"""""""""""""""""""""""""""""""""""""

-- " Colorschemes
Plug("navarasu/onedark.nvim")
-- " Plug('joshdick/onedark.vim')
Plug("briones-gabriel/darcula-solid.nvim")
Plug("rktjmp/lush.nvim")

-- """" Language binding """"""""""""""""""
-- " Plug('sheerun/vim-polyglot')
-- " Plug('pangloss/vim-javascript')
-- " Plug('HerringtonDarkholme/yats.vim')
-- " Plug('maxmellon/vim-jsx-pretty')
-- " Plug('moll/vim-node')
-- " Plug('othree/html5.vim')
-- " Plug('hail2u/vim-css3-syntax')
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
-- " Plug('m-demare/hlargs.nvim')

Plug("ziontee113/syntax-tree-surfer")
-- " Coc
-- " Plug('neoclide/coc.nvim', {'branch'= 'release', 'do': ':CocUpdate'})
-- """"""""""""""""""""""""""""""""""""""""

-- " markdown
Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && npx --yes yarn install" })
-- " Plug('MeanderingProgrammer/markdown.nvim')
-- """"""""""""""""""""""""""""""""""""""""

-- " Marks
-- " Plug('chentoast/marks.nvim')
-- """"""""""""""""""""""""""""""""""""""""

-- """"""""""""' Git
-- " Plug('airblade/vim-gitgutter')
Plug("tpope/vim-fugitive")
Plug("sindrets/diffview.nvim")
Plug("lewis6991/gitsigns.nvim")
-- """"""""""""""""""""""""""""""""""""""""

-- " NPM
Plug("neoclide/npm.nvim", { ["do"] = "npm install" })
-- """"""""""""""""""""""""""""""""""""""""

-- " Regex
Plug("rclawlor/regex-railroad.nvim")
-- """"""""""""""""""""""""""""""""""""""""

-- """" Tests
Plug("nvim-neotest/neotest")
Plug("nvim-neotest/neotest-jest")

Plug("klen/nvim-test")

Plug("johmsalas/text-case.nvim")

Plug("otavioschwanck/arrow.nvim")

-- " Plug('MunifTanjim/nui.nvim')
Plug("m4xshen/hardtime.nvim")

-- """"""""""""""""""""""""""""""""""""""""

-- " native lsp stuff
Plug("nvimtools/none-ls.nvim")
Plug("nvimtools/none-ls-extras.nvim")
Plug("zeioth/none-ls-autoload.nvim")

Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
Plug("williamboman/mason-lspconfig.nvim")
Plug("neovim/nvim-lspconfig")

Plug("davidmh/cspell.nvim")

Plug("kkoomen/vim-doge", {
	["do"] = function()
		vim.fn["doge#install"]()
	end,
})

Plug("yioneko/nvim-vtsls")

-- " Completion
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/cmp-nvim-lsp-signature-help")
Plug("SergioRibera/cmp-dotenv")
Plug("hrsh7th/nvim-cmp")

-- " Plug('folke/neodev.nvim')

-- " UI
Plug("gbrlsnchs/telescope-lsp-handlers.nvim")

Plug("MunifTanjim/nui.nvim")

Plug("stevearc/dressing.nvim")
-- " Plug('j-hui/fidget.nvim')

-- " Plug('ndonfris/fish-lsp', {'do' = 'yarn install'})
Plug("folke/noice.nvim")

Plug("folke/neoconf.nvim")

Plug("folke/lazydev.nvim")
Plug("Bilal2453/luvit-meta")

vim.call("plug#end")
