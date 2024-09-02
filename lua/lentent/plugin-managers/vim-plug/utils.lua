local vim = vim
local Plug = vim.fn["plug#"]
---@alias PluginOpts table
---
---@class PlugConfigOptions
---@field repo string
---@field name string display name and name used for plugin config files
---@field init? fun(self: any, opts: PluginOpts) Will always be run
---@field opts? PluginOpts
---@field priority? number Only useful for lazy=false plugins to force loading certain plugins first. Default priority is 50
---@field plug? table

---@class PlugConfig
---@field [1] string
---@field init fun() Will always be run
---@field plug table
---@field name string display name and name used for plugin config files
---@field priority number Only useful for lazy=false plugins to force loading certain plugins first. Default priority is 50

--- create a config def for plug
---@param options PlugConfigOptions
---@return PlugConfig
local function createConfig(options)
	return {
		options.repo,
		name = options.name,
		priority = options.priority or 50,
		plug = options.plug or {},
		init = options.init(nil, options.opts or {}) or function() end,
	}
end

---Load plugs
---@param plugs PlugConfig[]
local function loadPlugs(plugs)
	for _, plug in pairs(plugs) do
		Plug(plug.name, plug)
	end
end

---Load plugins
---@param plugs PlugConfig[]
---@param nonInitPlugs PlugConfigOptions[]
local function load(plugs, nonInitPlugs)
	---@type PlugConfig[]
	for _, plug in pairs(nonInitPlugs) do
		table.insert(plugs, createConfig(plug))
	end
  ---@type {[number]: PlugConfig[]}
	local ordered = {}
	local max = 0
	for _, val in pairs(plugs) do
		if val.priority > max then
			max = val.priority
		end
		local p = ordered[val.priority] or {}
		table.insert(p, val)
		ordered[val.priority] = p
	end

  vim.call("plug#begin")
  for i=1, max do
    for _, pPlugs in pairs(ordered[i]) do
      Plug(pPlugs[1], pPlugs.plug)
    end
  end
  vim.call("plug#end")
  for i=1, max do
    for _, pPlugs in pairs(ordered[i]) do
      pPlugs.init()
    end
  end
end
return {
	createConfig,
	load,
}
