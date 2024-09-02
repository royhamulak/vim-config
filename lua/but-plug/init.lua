local M = {}

---@param options ButConfig
M.setup = function(options)
	return {
		---@param butPlug ButPlugType
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
---@param options ButPlugConfig
---@return ButPlugConfig
M.createConfig = function(options)
	local newOptions = { table.unpack(options) }
	return newOptions
end

return M
