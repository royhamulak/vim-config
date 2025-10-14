vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- require("lentent.clipboard")

vim.filetype.add({
  extension = {
    mdx = "javascriptreact",
    yml = "yaml",
  },
  filename = {
    ["docker-compose.yml"] = "yaml.docker-compose",
  },
})

local butPlug = require("but-plug")
require("lentent")
local lsp = require("lentent.lsp")

butPlug
    .setup({
      plugins = vim.list_extend(require("lentent.plugins"), lsp.plugins),
    })
    .but("lazy")

lsp.setup({ "marksman", "nixd", "lua_ls", "vtsls", "fish_lsp", "jsonls", "yamlls", "tombi" })
