local load = require("lentent.lsp.utils")
local default_config = {
  cmd = { "nixd" },
  settings = {
    nixpkgs = {
      expr = "(import <nixpkgs> {})",
    },
    formatting = {
      command = { "nixfmt" },
    },
    options = {
      ["home-manager"] = {
        expr = "(builtins.getFlake (builtins.toString ./.)).inputs.home-manager",
      },
      nixpkgs = {
        expr = "(builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs",
      },
    },
  },
}

return load("nixd", default_config).enable()
