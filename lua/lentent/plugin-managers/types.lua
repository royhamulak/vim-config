---@class GeneralConfig: LazyPluginSpec
---@field plug? table

---@class SuperPlugConfig
---@field lazy? boolean
---@field plugins? GeneralConfig[]

---@generic T
---@alias SetupDef fun(options: T, plugins?: GeneralConfig[])
