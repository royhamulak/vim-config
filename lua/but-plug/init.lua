local M = {}

---@param options ButConfig
M.setup = function(options)
	return {
		---@param butPlug ButPlugType
		---@param pluginManagerOptions? LazyConfig
		but = function(butPlug, pluginManagerOptions)
      local opts = (type(options.plugins) == 'function' and options.plugins or function () return options.plugins end)()
			require("but-plug.adapters." .. butPlug).setup(opts, pluginManagerOptions)
		end,
	}
	-- if options.lazy == true then
	--   require("but-plug.lazy")
	-- else
	--   require("but-plug.vim-plug")
	-- end
end

--- create a config def for plug
---@param options ButPlugConfig
---@return ButPlugConfig
_G.createButPlugConfig = function(options)
	local newOptions = vim.tbl_deep_extend("force", {}, options)
	return newOptions
end

return M
