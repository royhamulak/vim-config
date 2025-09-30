local _M = {}

_M.plugins = {
  createButPlugConfig({ "nvimtools/none-ls.nvim", enabled = true }),
  createButPlugConfig({ "nvimtools/none-ls-extras.nvim", enabled = true }),
  -- createButPlugConfig({ "zeioth/none-ls-autoload.nvim", enabled = true }),
  createButPlugConfig({ "neovim/nvim-lspconfig", enabled = true }),
  createButPlugConfig({ "davidmh/cspell.nvim", enabled = true }),
  createButPlugConfig({ "yioneko/nvim-vtsls", enabled = true }),
  createButPlugConfig({
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "nvim_lsp_signature_help" },
          -- {name = "buffer"}
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = {
          disallow_fuzzy_matching = false,
          disallow_fullfuzzy_matching = false,
          disallow_partial_fuzzy_matching = true,
          disallow_partial_matching = false,
          disallow_prefix_unmatching = false,
          disallow_symbol_nonprefix_matching = false,
        },
      })
    end,
    enabled = true,
  }),
  createButPlugConfig({ "hrsh7th/cmp-nvim-lsp", enabled = true }),
  createButPlugConfig({ "hrsh7th/cmp-buffer", enabled = true }),
  createButPlugConfig({ "hrsh7th/cmp-path", enabled = true }),
  createButPlugConfig({ "hrsh7th/cmp-cmdline", enabled = true }),
  createButPlugConfig({ "hrsh7th/cmp-nvim-lsp-signature-help", enabled = true }),
  createButPlugConfig({ "SergioRibera/cmp-dotenv", enabled = true }),
  createButPlugConfig({ "gbrlsnchs/telescope-lsp-handlers.nvim", enabled = true }),
  createButPlugConfig({ "Bilal2453/luvit-meta", enabled = true }),
  require("lentent.plugins.lspsaga"),
  createButPlugConfig({
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    enabled = true,
  }),
  require("lentent.plugins.neoconf"),
  require("lentent.plugins.lazydev"),
  createButPlugConfig({ "dmmulroy/ts-error-translator.nvim", enabled = true }),
  createButPlugConfig({
    "ndonfris/fish-lsp",
    build = "yarn install",
    dependencies = { "nvim-tree/nvim-tree.lua" },
  }),
  createButPlugConfig({
    "b0o/schemastore.nvim",
  }),
  createButPlugConfig({
    "esmuellert/nvim-eslint",
    config = function()
      require("nvim-eslint").setup({})
    end,
  }),
}

_M.customLspConfigs = {}
local function createCustomConfigs()
  return {
    vtsls = {
      vtsls = {
        autoUseWorkspaceTsdk = true,
        -- experimental = {
        -- 	completion = {
        -- 		enableServerSideFuzzyMatch = true,
        -- 	},
        -- },
      },
      javascript = {
        preferences = {
          quoteStyle = "single",
          importModuleSpecifierEnding = "js",
        },
        referencesCodeLens = {
          enabled = true,
          showOnAllFunction = true,
        },
        inlayHints = {
          -- parameterNames = {
          -- 	enabled = "all",
          -- },
          -- parameterTypes = {
          -- 	enabled = true,
          -- },
          -- variableTypes = {
          -- 	enabled = true,
          -- },
          -- propertyDeclarationTypes = {
          -- 	enabled = true,
          -- },
          -- functionLikeReturnTypes = {
          -- 	enabled = true,
          -- },
          -- enumMemberValues = {
          -- 	enabled = true,
          -- },
        },
      },
      typescript = {
        -- preferGoToSourceDefinition = true,
        workspaceSymbols = {
          scope = "currentProject",
        },
        preferences = {
          quoteStyle = "single",
          importModuleSpecifierEnding = "js",
          preferTypeOnlyAutoImports = true,
        },
        referencesCodeLens = {
          enabled = true,
          showOnAllFunction = true,
        },
        inlayHints = {
          -- parameterNames = {
          -- 	enabled = "all",
          -- },
          -- parameterTypes = {
          -- 	enabled = true,
          -- },
          -- variableTypes = {
          -- 	enabled = true,
          -- },
          -- propertyDeclarationTypes = {
          -- 	enabled = true,
          -- },
          -- functionLikeReturnTypes = {
          -- 	enabled = true,
          -- },
          -- enumMemberValues = {
          -- 	enabled = true,
          -- },
        },
        suggest = {
          completeFunctionCalls = true,
        },
        implementationsCodeLens = {
          enabled = true,
          showOnInterfaceMethods = true,
        },
      },
    },
    nil_ls = {
      ["nil"] = {
        formatting = { "nixfmt" },
      },
      nix = {
        binary = "nix",
        flake = {
          autoArchive = true,
          autoEvalInputs = true,
          nixpkgsInputName = "nixpkgs",
        },
      },
    },
    nixd = {
      cmd = { "nixd", "--inlay-hints=true", "--semantic-tokens=true" },
      settings = {
        nixd = {
          nixpkgs = {
            expr = "import (builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs { }",
          },
          formatting = {
            command = { "nixfmt" },
          },
          options = {
            nixos = {
              expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.home-pc-nix.options",
            },

            ["home-manager"] = {
              expr =
              "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.home-pc-nix.options.home-manager.users.type.getSubOptions []",
            },
            -- ["flake-parts"] = {
            --   expr = 'builtins.getFlake (builtins.toString ./.).currentSystem.options',
            -- },
            -- lib = {
            --   expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.home-pc-nix.options"
            -- },
            -- stdenv = {
            --
            --   expr = "pkgs.stdenv.options"
            -- },
          },
        },
      },
    },
    yamlls = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] =
          "/*.k8s.yaml",
        },
      },
    },
    jsonls = {
      cmd = {
        "vscode-json-languageserver",
        "--stdio",
      },
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  }
end

local function getCmpCapabilities()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

_M.loadLSPs = function(lsps, caps, customLspConfigs)
  -- local lspconfig = require("lspconfig")
  for _, pkg in pairs(lsps) do
    local ali = pkg
    -- if customLspConfigs[ali] then
    ---@diagnostic disable-next-line: missing-fields
    -- require("notify").notify(ali .. vim.inspect(customLspConfigs[ali]), vim.log.levels.INFO, {
    --   keep = function()
    --     return true
    --   end,
    -- })
    -- lspconfig[ali].setup({ settings = _M.customLspConfigs[ali] or {} })

    vim.lsp.config(ali, (customLspConfigs[ali] or {}))
    -- print(vim.inspect(vim.lsp.config._configs[ali]))
    -- end
    vim.lsp.enable(ali)
  end
end

local function setupLspAutoCommand()
  local lspAUGroup = vim.api.nvim_create_augroup("UserLspConfig", {})
  vim.api.nvim_create_autocmd("LspAttach", {
    group = lspAUGroup,
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      local bufnr = ev.buf
      -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
      -- if client.server_capabilities.completionProvider then vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      -- end
      -- if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
      -- end
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

      -- vim.api.nvim_create_autocmd({ "LspTokenUpdate", "BufEnter", "FocusGained" }, {
      -- 	callback = function(_ev)
      -- 		vim.lsp.codelens.refresh({ bufnr = _ev.buf })
      -- 	end,
      -- })

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, opts)
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, opts)

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      -- vim.keymap.set({ 'n', 'v' }, '<leader>ac', actionPreview.code_actions, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts)
      -- vim.keymap.set('n', 'gr', tele_builtins.lsp_references, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

      vim.keymap.set("n", "<leader>ld", function()
        require("telescope.builtin").diagnostics({ bufnr = 0 })
      end, opts)
      vim.keymap.set("n", "<leader>pr", function()
        vim.lsp.buf.format({
          filter = function(_client)
            return _client.name ~= "vtsls"
          end,
          async = true,
        })
      end, opts)
    end,
  })
end

local function setupNullLs()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      -- cspell.code_actions,
      -- cspell.diagnostics,
      null_ls.builtins.diagnostics.codespell,
      null_ls.builtins.formatting.codespell,

      -- null_ls.builtins.diagnostics.selene,
      --
      --     -- null_ls.builtins.code_actions.proselint.with({filetypes = {}}),
      --     -- null_ls.builtins.diagnostics.proselint.with({filetypes = {}}),
      --
      -- null_ls.builtins.diagnostics.sqlfluff.with({
      -- 	extra_args = { "--dialect", "snowflake" },
      -- }),
      -- null_ls.builtins.formatting.sqlfluff.with({
      -- 	extra_args = { "--dialect", "snowflake" },
      -- }),

      null_ls.builtins.formatting.nixfmt,
      -- --
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd.with({ filetypes = { "javascript", "typescript" } }),
    },
  })
end
_M.setup = function(lsps)
  vim.lsp.inlay_hint.enable(true)
  local capabilities = getCmpCapabilities()

  require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended

  -- vim.lsp.config("*", { capabilities = capabilities })
  -- require("lentent.lsp.nixd").enable()
  _M.loadLSPs(lsps, capabilities, createCustomConfigs())

  setupLspAutoCommand()

  setupNullLs()
end

return _M
