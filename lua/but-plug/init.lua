local M = {}

---@param options PluginConfigs
M.setup = function(options)
	return {
		---@param butPlug ButPlug
		but = function(butPlug)
			require("but-plug.adapters." .. butPlug).setup(options.plugins)
		end,
	}
	-- if options.lazy == true then
	--   require("but-plug.lazy")
	-- else
	--   require("but-plug.vim-plug")
	-- end
end

--- create a config def for plug
---@param options GeneralConfig
---@return GeneralConfig
M.createConfig = function(options)
	local newOptions = { table.unpack(options) }
	return newOptions
end

return M
