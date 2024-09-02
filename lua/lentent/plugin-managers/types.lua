---@module lazy
---@class GeneralConfig: LazyPluginSpec
---@field custom? table

---@class SuperPlugConfig
---@field lazy? boolean
---@field plugins? GeneralConfig[]

---@generic T
---@alias SetupDef fun(options: T, plugins?: GeneralConfig[])
