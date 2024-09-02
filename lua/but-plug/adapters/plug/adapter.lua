local M = {}
local vim = vim
local Plug = vim.fn["plug#"]
local createConfig = require("but-plug").createConfig

---@param options GeneralConfig
---@return VimPlugConfig
local function createPlugConfig(options)
	---@type VimPlugConfig
	local vimPlugConf = {
		init = function() end,
		priority = 50,
		table.unpack(createConfig(options)),
	}

	return vimPlugConf
end

---Load plugins
---@param plugs GeneralConfig[]
---@param nonInitPlugs string[]
M.load = function(plugs, nonInitPlugs)
	---@type GeneralConfig[]
	for _, plug in pairs(nonInitPlugs) do
		table.insert(plugs, createPlugConfig({ plug }))
	end
	---@type {[number]: VimPlugConfig[]}
	local ordered = {}
	for _, val in pairs(plugs) do
		ordered[val.priority] = table.insert((ordered[val.priority] or {}), val)
	end

	vim.call("plug#begin")
	for _, pPlugs in ipairs(ordered) do
		for _, plug in pairs(pPlugs) do
			Plug(plug, plug.custom.plug)
		end
	end
	vim.call("plug#end")

	for _, pPlugs in ipairs(ordered) do
		for _, plug in pairs(pPlugs) do
			plug.init()
		end
	end
end

return M
