local M = {}

---@param options SuperPlugConfig
M.setup = function(options)
	if options.lazy == true then
		require("lentent.plugin-managers.lazy")
	else
		require("lentent.plugin-managers.vim-plug")
	end
end

--- create a config def for plug
---@param options GeneralConfig
---@return GeneralConfig
M.createConfig = function(options)
	local newOptions = { table.unpack(options) }
	return newOptions
end

return M
