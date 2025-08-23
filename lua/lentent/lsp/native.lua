local _M = {}

_M.plugins = {
  createButPlugConfig({ "nvimtools/none-ls.nvim", enabled = true }),
  createButPlugConfig({ "nvimtools/none-ls-extras.nvim", enabled = true }),
  -- createButPlugConfig({ "zeioth/none-ls-autoload.nvim", enabled = true }),
  createButPlugConfig({
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      PATH = "append",
    },
    priority = 999,
    enabled = false,
  }),
  createButPlugConfig({ "neovim/nvim-lspconfig", enabled = true }),
  createButPlugConfig({
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- ensure_installed = {
        --   -- "cspell",
        --   -- "codespell",
        --   "vtsls",
        --   -- "eslint-lsp",
        --   -- "prettier",
        --   -- "stylua",
        --   "nil_ls",
        --   -- "nixfmt",
        --   "lua_ls",
        -- },
        -- -- automatic_enable = true,
      })
    end,
    enabled = false,
  }),
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
  -- require("lentent.plugins.lspsaga"),
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
}

_M.customLspConfigs = {
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
      formatting = {
        command = { "nixfmt" },
      },
      nix = {
        flake = {
          autoEvalInputs = true,
          nixpkgsInputName = "nixpkgs",
        },
      },
    },
  },
}

local function getCmpCapabilities()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  return capabilities
end

 _M.loadLSPs = function(lsps, caps)
  local lspconfig = require("lspconfig")
  for _, pkg in pairs(lsps) do
    local ali = pkg
    if not _M.customLspConfigs[ali] then
      lspconfig[ali].setup({ capabilities = caps })
    else
      lspconfig[ali].setup({ capabilities = caps, settings = _M.customLspConfigs[ali] })
    end
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
      -- if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      -- end
      -- if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
      -- end
      -- vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

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
  -- local cspell = require('cspell')

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
    },
  })
end

_M.setup = function()
  local capabilities = getCmpCapabilities()

  require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended

  _M.loadLSPs({ "nil_ls", "lua_ls", "vtsls", "fish_lsp" }, capabilities)

  setupLspAutoCommand()

  setupNullLs()
  -- vim.api.nvim_create_autocmd("LspDetach", {
  -- 	group = lspAUGroup,
  -- 	callback = function(args)
  -- 		local client = -- vim.lsp.get_client_by_id(args.data.client_id)
  -- 		-- Do something with the client
  -- 		vim.cmd("setlocal tagfunc< omnifunc<")
  -- 	end,
  -- })
  --
  -- require("none-ls-autoload").setup({
  --   external_sources = {
  --     "cspell.code_actions",
  --     "cspell.diagnostics",
  --   },
  -- })
  --
end

-- require("mason").setup({
-- 	ensure_installed = {
-- 		"cspell",
-- 		--"codespell",
-- 		"vtsls",
-- 		"eslint-lsp",
-- 		"prettier",
-- 		"stylua",
-- 	},
-- })
--

return _M
