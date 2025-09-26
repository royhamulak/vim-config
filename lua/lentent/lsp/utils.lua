return function(lspName, customConfig)
  local lspConfig = require("lspconfig.configs." .. lspName).default_config
  local mergedConfig = vim.tbl_deep_extend("keep", customConfig, lspConfig or {})

  -- vim.print(vim.inspect(mergedConfig))
  vim.lsp.config(lspName, mergedConfig)

  -- vim.lsp.enable(lspName, true)
  local _M = {}
  _M.enable = function()
    vim.notify("Enabling config for " .. lspName, vim.log.levels.INFO)
    vim.notify("loaded config for " .. lspName .. "\n" .. vim.inspect(mergedConfig), vim.log.levels.DEBUG)
    vim.lsp.enable(lspName, true)
    return _M
  end
  _M.restart = function()
    vim.notify("restarting " .. lspName, vim.log.levels.INFO)
    vim.lsp.enable(lspName, false)
    vim.lsp.enable(lspName, true)
    return _M
  end
  return _M
end
