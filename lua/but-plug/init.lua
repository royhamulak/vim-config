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

local function setmeta(res, tbl)
  local mt = getmetatable(tbl)
  return mt and setmetatable(res, mt) or res
end

---@class Intersection<T, U>
---|U
---|T

--- combine two tables, either as union or intersection. Corresponds to
--- set operations for sets () but more general. Not particularly
--- useful for list-like tables.
---@generic T: table
---@generic U: table
---@param t1 T
---@param t2 U
---@return T & U
_G.customMerge = function(t1, t2)
  local res = {}
  for k, v in pairs(t1) do
    if not t2[k] then
      res[k] = v
    end
  end

  for k, v in pairs(t2) do
    res[k] = v
  end

  return res
end

--- create a config def for plug
---@param options ButPlugConfig
---@return ButPlugConfig
_G.createButPlugConfig = function(options)
  local newOptions = customMerge({}, options)
  return newOptions
end

return M
