local M = {}

M.options = {}

---Parse the config for lazy-vim
---@param config ButPlugConfig
---@return LazyPluginSpec
local function parseConfig(config)
	return config
end

---@param  plugins ButPlugConfig[]
---@return LazyConfig
local function defaults(plugins)
	---@type LazyPluginSpec[]
	local spec = vim.tbl_map(parseConfig, plugins)

	return {
		spec = spec,
	}
end

---@param plugins ButPlugConfig[]
---@param options? LazyConfig
M.setup = function(plugins, options)
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end
	vim.opt.rtp:prepend(lazypath)

	-- Make sure to setup `mapleader` and `maplocalleader` before
	-- loading lazy.nvim so that mappings are correct.
	-- This is also a good place to setup other settings (vim.opt)
	-- Setup lazy.nvim

	M.options = vim.tbl_deep_extend("force", defaults(plugins), options or {})
	local lazy = require("lazy")
	lazy.setup(M.options)
end

return M
