---@module lazy
---@class GeneralConfig: LazyPluginSpec
---@field custom? table

---@class PluginConfigs
---@field plugins? GeneralConfig[]
---
---@alias ButPlug
---| '"plug"' vim-plug
---| '"lazy"' lazy plugin maanger

---@generic T
---@alias SetupDef fun(options: T, plugins?: GeneralConfig[])
