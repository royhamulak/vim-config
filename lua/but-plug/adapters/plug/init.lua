-- local plugins = require("lentent.plugins")
local M = {}
local vim = vim
local Plug = vim.fn["plug#"]

---Flatten an array up to certain level
---@generic T
---@param arr {[any]: T}
---@param level? number
---@return T
local function flatten(arr, level)
	level = level or 1
	local res = {}
	if level > 0 then
		if type(arr) == "table" then
			vim.tbl_map(function(v)
				vim.list_extend(res, flatten(v, level - 1))
			end, arr)
		else
			table.insert(res, arr)
		end
	else
		return arr
	end
	return res
end

M.orderedPlugins = {}

---@param plug ButPlugConfig
local function createPlugHooks(plug)
	---@class VimPlugHooks
	local plugHooks = {
		["do"] = plug.build,
		tag = plug.tag,
	}
	if next(plugHooks) == nil then
		return nil
	end

	return plugHooks
end

---@param options ButPlugConfig
local function createPlugConfig(options)
	---@class VimPlugConfig
	local defaults = {
		init = function() end,
		priority = 50,
		plug = createPlugHooks(options),
	}

	return vim.tbl_deep_extend("force", defaults, createButPlugConfig(options))
end

---@param plugins ButPlugConfig[]
local function orderPlugins(plugins)
	---@type {[number]: VimPlugConfig[]}
	local ordered = {}

	for _, val in pairs(plugins) do
		local vimPlugConf = createPlugConfig(val)
		if not ordered[vimPlugConf.priority] then
			ordered[vimPlugConf.priority] = {}
		end
		table.insert(ordered[vimPlugConf.priority], vimPlugConf)
	end

	return flatten(ordered)
end

---Add the plugins to vim plug
---@param plugins VimPlugConfig[]
local function addPlugins(plugins)
	vim.call("plug#begin")
	for _, plug in pairs(plugins) do
		if plug.plug then
			Plug(plug[1], plug.plug)
		else
			Plug(plug[1])
		end
	end

	vim.call("plug#end")
end

---Init the plugins
---@param plugins VimPlugConfig[]
local function initPlugins(plugins)
	for _, plug in pairs(plugins) do
		plug.init()
	end
end

---Load plugins
---@param plugs ButPlugConfig[]
M.reload = function(plugs)
	---@type {[number]: VimPlugConfig[]}

	M.orderedPlugins = orderPlugins(plugs)
	-- vim.print(vim.inspect(M.orderedPlugins))

	addPlugins(M.orderedPlugins)

	initPlugins(M.orderedPlugins)
end

---@param plugins ButPlugConfig[]
M.setup = function(plugins)
	M.reload(plugins)
end

-- vim.call("plug#begin")
-- " Core Stuff
-- Plug("junegunn/fzf", {
-- 	["do"] = function()
-- 		vim.fn["fzf#install"]()
-- 	end,
-- })
-- Plug("junegunn/fzf.vim")
-- Plug("RRethy/vim-illuminate")

-- Plug("nvim-tree/nvim-web-devicons")
-- " Plug('ryanoasis/vim-devicons')

-- Plug("nvim-lualine/lualine.nvim")
-- Plug("akinsho/bufferline.nvim", { tag = "*" })

-- Plug("nvim-lua/plenary.nvim")
-- Plug("antoinemadec/FixCursorHold.nvim")
-- Plug("nvim-telescope/telescope.nvim", { tag = "0.1.x" })

-- Plug("rcarriga/nvim-notify")
-- """"""""""""""""""""""""""""""""""""""""

-- " General
-- Plug("tpope/vim-surround")
-- Plug("norcalli/nvim-colorizer.lua")
-- Plug("tomtom/tcomment_vim")

-- " Mini,nvim
-- Plug("echasnovski/mini.indentscope")

-- """"" File tree plugin
-- Plug("nvim-tree/nvim-tree.lua")
-- " Plug('scrooloose/nerdtree')
-- " Plug('Xuyuanp/nerdtree-git-plugin')
-- """"""""""""""""""""""""""""""""""""""""

-- " Colorschemes
-- Plug("navarasu/onedark.nvim")
-- " Plug('joshdick/onedark.vim')
-- Plug("briones-gabriel/darcula-solid.nvim")
-- Plug("rktjmp/lush.nvim")

-- """" Language binding """"""""""""""""""
-- " Plug('sheerun/vim-polyglot')
-- " Plug('pangloss/vim-javascript')
-- " Plug('HerringtonDarkholme/yats.vim')
-- " Plug('maxmellon/vim-jsx-pretty')
-- " Plug('moll/vim-node')
-- " Plug('othree/html5.vim')
-- " Plug('hail2u/vim-css3-syntax')
-- Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
-- " Plug('m-demare/hlargs.nvim')

-- Plug("ziontee113/syntax-tree-surfer")
-- " Coc
-- " Plug('neoclide/coc.nvim', {'branch'= 'release', 'do': ':CocUpdate'})
-- """"""""""""""""""""""""""""""""""""""""

-- " markdown
-- Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && npx --yes yarn install" })
-- " Plug('MeanderingProgrammer/markdown.nvim')
-- """"""""""""""""""""""""""""""""""""""""

-- " Marks
-- " Plug('chentoast/marks.nvim')
-- """"""""""""""""""""""""""""""""""""""""

-- """"""""""""' Git
-- " Plug('airblade/vim-gitgutter')
-- Plug("tpope/vim-fugitive")
-- Plug("sindrets/diffview.nvim")
-- Plug("lewis6991/gitsigns.nvim")
-- """"""""""""""""""""""""""""""""""""""""

-- " NPM
-- Plug("neoclide/npm.nvim", { ["do"] = "npm install" })
-- """"""""""""""""""""""""""""""""""""""""

-- " Regex
-- Plug("rclawlor/regex-railroad.nvim")
-- """"""""""""""""""""""""""""""""""""""""

-- """" Tests
-- Plug("nvim-neotest/neotest")
-- Plug("nvim-neotest/neotest-jest")

-- Plug("klen/nvim-test")

-- Plug("johmsalas/text-case.nvim")

-- Plug("otavioschwanck/arrow.nvim")

-- " Plug('MunifTanjim/nui.nvim')
-- Plug("m4xshen/hardtime.nvim")

-- """"""""""""""""""""""""""""""""""""""""

-- " native lsp stuff
-- Plug("nvimtools/none-ls.nvim")
-- Plug("nvimtools/none-ls-extras.nvim")
-- Plug("zeioth/none-ls-autoload.nvim")
--
-- Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
-- Plug("williamboman/mason-lspconfig.nvim")
-- Plug("neovim/nvim-lspconfig")
--
-- Plug("davidmh/cspell.nvim")
--
-- Plug("kkoomen/vim-doge", {
--   ["do"] = function()
--     vim.fn["doge#install"]()
--   end,
-- })
--
-- Plug("yioneko/nvim-vtsls")
--
-- -- " Completion
-- Plug("hrsh7th/cmp-nvim-lsp")
-- Plug("hrsh7th/cmp-buffer")
-- Plug("hrsh7th/cmp-path")
-- Plug("hrsh7th/cmp-cmdline")
-- Plug("hrsh7th/cmp-nvim-lsp-signature-help")
-- Plug("SergioRibera/cmp-dotenv")
-- Plug("hrsh7th/nvim-cmp")
--
-- -- " Plug('folke/neodev.nvim')
--
-- -- " UI
-- Plug("gbrlsnchs/telescope-lsp-handlers.nvim")
--
-- Plug("MunifTanjim/nui.nvim")
--
-- Plug("stevearc/dressing.nvim")
-- -- " Plug('j-hui/fidget.nvim')
--
-- -- " Plug('ndonfris/fish-lsp', {'do' = 'yarn install'})
-- -- Plug("folke/noice.nvim")
--
-- -- Plug("folke/neoconf.nvim")
--
-- -- Plug("folke/lazydev.nvim")
-- Plug("Bilal2453/luvit-meta")
--
-- Plug("nvimdev/lspsaga.nvim")
--
-- Plug("tris203/precognition.nvim")
-- Plug("folke/lazy.nvim")

-- vim.call("plug#end")

return M
