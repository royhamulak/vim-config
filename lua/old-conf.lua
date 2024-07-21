vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
local mapKeys = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("neoconf").setup({})

require("nvim-web-devicons").setup()

require("bufferline").setup({
  options = {
    indicator = {
      style = "underline",
    },
    numbers = "ordinal",
    diagnostics = "coc",
    color_icons = true,
    truncate_names = false,
  },
})

require("lualine").setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename", "g:coc_status" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  -- tabline = {
  --   lualine_a = {
  --     {
  --       'buffers',
  --       mode = 2,
  --       use_mode_colors = true,
  --       symbols = {
  --         modified = ' +',      -- Text to show when the buffer is modified
  --         alternate_file = '#', -- Text to show to identify the alternate file
  --         directory =  '',     -- Text to show when the buffer is a directory
  --       },
  --     }
  --   },
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {'tabs'}
  -- }
})

require("onedark").setup({
  style = "warmer",
  transparent = true,
  highlights = {
    ["@type"] = { fg = "$red" },
    ["@variable.parameter"] = { fg = "$yellow" },
  },
})

require("onedark").load()

local onedarkColors = require("onedark.colors")

require("colorizer").setup()
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "typescript",
    "json",
    "javascript",
    "yaml",
    "jsonc",
    "html",
    "vim",
    "vimdoc",
    "lua",
    "css",
    "bash",
    "csv",
    "dockerfile",
    "elm",
    "fish",
    "markdown",
    "astro",
    "sql",
    "regex",
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = false,
    -- keymaps = {
    --   init_selection = "<leader>s",
    --   node_incremental = "s",
    --   scope_incremental = "S",
    --   node_decremental = "d",
    -- }
  },
})

-- require('render-markdown').setup({})

require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "+" },
  },
  signcolumn = true,
  numhl = true,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 100,
  },
})

-- {{{ Regex

-- require("regex-railroad").setup({
--     --- Github release of plugin
--     tag = "v0.0.1",
--     --- Highlight group used in :RegexText
--     highlight = {
--         bold = true,
--         fg = onedarkColors.fg,
--         bg = onedarkColors.bg0,
--     }})
--
-- vim.api.nvim_set_keymap("n", "<leader>re", "<cmd>RegexText<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>RegexRailroad<CR>", {noremap = true, silent = true})
-- }}}

mapKeys("n", "<leader><C-c>", "<cmd>TSContextToggle<cr>", opts)

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.del("n", "<C-x>", { buffer = bufnr })
  -- vim.keymap.del('n', '<2-LeftMouse>', { buffer = bufnr })
  -- vim.keymap.del('n', '<2-RighMouse>', { buffer = bufnr })
  vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

local function open_middle_win(partial)
  return function()
    local win_height = vim.go.lines
    local win_width = vim.go.columns
    local height = win_height * partial
    local width = win_width * partial
    local row = (win_height - height) / 2
    local col = (win_width - width) / 2
    return {
      relative = "editor",
      border = "rounded",
      height = math.floor(height),
      width = math.floor(width),
      row = row,
      col = col,
      focusable = true,
    }
  end
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
  view = {
    float = {
      enable = false,
      open_win_config = open_middle_win(0.7),
    },
  },
  renderer = {
    add_trailing = true,
    highlight_git = true,
    highlight_diagnostics = true,
    highlight_opened_files = "all",
    full_name = true,
    special_files = {},
    -- indent_markers = {
    --   enable = true,
    -- },
    icons = {
      web_devicons = {
        folder = {
          enable = true,
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
  },
  modified = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filters = {
    -- git_ignored = false,
  },
  filesystem_watchers = {
    ignore_dirs = {
      "build$",
      "node_modules",
    },
  },
  actions = {
    file_popup = {
      open_win_config = {
        border = "rounded",
      },
    },
    open_file = {
      quit_on_open = true,
    },
  },
})

require("mini.indentscope").setup({
  draw = {
    animation = require("mini.indentscope").gen_animation.none(),
  },
})

-- require("neotest").setup({
--   adapters = {
--     require("neotest-jest")({
--       jestCommand = "npm run test:jest --",
--       -- jestConfigFile = function()
--       --   local file = vim.fn.expand('%:p')
--       --   if string.find(file, "/packages/") then
--       --     return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
--       --   end
--       --
--       --   return vim.fn.getcwd() .. "/jest.config.ts"
--       -- end,
--       -- cwd = function ()
--       --   return vim.fn.getcwd()
--       -- end,
--       jest_test_discovery = true,
--     })
--   },
--   summary = {
--     mappings = {
--       expand = "e",
--       expand_all = "E",
--     },
--     open = "botright vsplit | vertical resize 80"
--   },
--   discovery = {
--     enabled = false,
--     filter_dir = function(name, rel_path)
--       if string.find(rel_path, "test") then
--         vim.print("yes " .. rel_path)
--         return true
--       end
--       vim.print("no " .. rel_path)
--       -- vim.print(root)
--       return false
--     end
--   },
--   -- output = {
--   --   enabled = true,
--   --   open_on_run = true,
--   -- },
--   -- status = {
--   --   enabled = true,
--   --   virtual_text = true,
--   -- },
--   -- state = {
--   --   enabled = true,
--   -- },
-- })
--
--
-- mapKeys("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", opts)
-- mapKeys("n", "<leader>ta", "<cmd>Neotest attach<CR>", opts)
-- mapKeys("n", "<leader>to", "<cmd>lua require('neotest').output.open({last_run=true})<CR>", opts)
-- mapKeys("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'npm run test:jest -- --watch' })<CR>", opts)
-- mapKeys("n", "<leader>tt", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), jestCommand = 'npm run test:jest -- --watch' })<CR>", opts)
-- mapKeys("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", opts)
--
-- mapKeys("n", "]t", "<cmd>lua require('neotest').jump.next()<CR>", opts)
-- mapKeys("n", "[t", "<cmd>lua require('neotest').jump.prev()<CR>", opts)

require("notify").setup({
  background_colour = onedarkColors.bg0,
  render = "wrapped-compact",
  fps = 120,
  stages = "fade",
  max_width = 30,
  timeout = 250,
})

vim.notify = require("notify")
-- require('hlargs').setup({
--   color = onedarkColors.yellow,
--   paint_catch_blocks = {
--     declarations = true,
--     usages = true,
--   },
--   extras = {
--     named_parameters = true,
--   },
-- })

vim.filetype.add({
  extension = {
    mdx = "javascriptreact",
    yml = "yaml",
  },
  filename = {
    ["docker-compose.yml"] = "yaml.docker-compose",
  },
})

require("nvim-test").setup({
  runners = { -- setup tests runners
    cs = "nvim-test.runners.dotnet",
    go = "nvim-test.runners.go-test",
    haskell = "nvim-test.runners.hspec",
    javascriptreact = "nvim-test.runners.jest",
    javascript = "nvim-test.runners.jest",
    lua = "nvim-test.runners.busted",
    python = "nvim-test.runners.pytest",
    ruby = "nvim-test.runners.rspec",
    rust = "nvim-test.runners.cargo-test",
    typescript = "nvim-test.runners.jest",
    typescriptreact = "nvim-test.runners.jest",
  },
})

require("nvim-test.runners.jest"):setup({
  command = "npm",
  args = { "run", "test:jest", "--", "--collectCoverage=false" },
  file_pattern = "\\v((__tests__|tests)/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$",
  find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" },
  filename_modifier = nil,
  working_directory = nil,
})
mapKeys("n", "<leader>t", "<cmd>TestNearest<CR>", opts)
mapKeys("n", "<leader>tf", "<cmd>TestFile<CR>", opts)
mapKeys("n", "<leader>ta", "<cmd>TestSuite<CR>", opts)
mapKeys("n", "<leader>tt", "<cmd>TestLast<CR>", opts)
mapKeys("n", "<leader>tv", "<cmd>TestVisit<CR>", opts)

require("textcase").setup({})

require("arrow").setup({
  always_show_path = true,
  show_icons = true,
  leader_key = "\\",
})

local telescope = require("telescope")
local telescopeThemes = require("telescope.themes")

telescope.load_extension("lsp_handlers")
telescope.setup({
  defaults = {
    dynamic_preview_title = true,
    initial_mode = "normal",
  },
  pickers = {
    git_files = {
      use_git_root = false,
      initial_mode = "insert",
    },
    live_grep = {
      initial_mode = "insert",
    },
    find_files = {
      initial_mode = "insert",
    },
  },
})

vim.cmd([[
nnoremap gau :lua require('textcase').current_word('to_upper_case')<CR>
nnoremap gal :lua require('textcase').current_word('to_lower_case')<CR>
nnoremap gas :lua require('textcase').current_word('to_snake_case')<CR>
nnoremap gad :lua require('textcase').current_word('to_dash_case')<CR>
nnoremap gan :lua require('textcase').current_word('to_constant_case')<CR>
nnoremap gad :lua require('textcase').current_word('to_dot_case')<CR>
nnoremap gaa :lua require('textcase').current_word('to_phrase_case')<CR>
nnoremap gac :lua require('textcase').current_word('to_camel_case')<CR>
nnoremap gap :lua require('textcase').current_word('to_pascal_case')<CR>
nnoremap gat :lua require('textcase').current_word('to_title_case')<CR>
nnoremap gaf :lua require('textcase').current_word('to_path_case')<CR>
]])

telescope.load_extension("textcase")

local tele_builtins = require("telescope.builtin")

vim.keymap.set("n", "<C-F>", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<C-P>", function()
  if os.execute("git rev-parse --show-top-level 2> /dev/null") == 0 then
    tele_builtins.git_files({ show_untracked = true })
  else
    tele_builtins.find_files()
  end
end, opts)

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- require("marks").setup({
-- })
-- require("hardtime").setup()

-- Native LSP stuff
--

-- require('fidget').setup({})
-- require('dressing').setup({
--   select = {
--     backend = {
--       "nui",
--       "fzf_lua",
--       "telescope",
--       "fzf",
--       "builtin"
--    },
--   }
-- })

require("noice").setup({
  cmdline = {
    enabled = true,
    view = "cmdline",
    format = {
      conceal = false,
    },
  },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- -- you can enable a preset for easier configuration
  -- presets = {
  --   bottom_search = true, -- use a classic bottom cmdline for search
  --   command_palette = true, -- position the cmdline and popupmenu together
  --   long_message_to_split = true, -- long messages will be sent to a split
  --   inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --   lsp_doc_border = false, -- add a border to hover docs and signature help
  -- },
})

require("neodev").setup({})

require("mason").setup({
  ensure_installed = {
    "cspell",
    --"codespell",
    "vtsls",
    "eslint-lsp",
    "prettier",
    "stylua",
  },
})

local masonReg = require("mason-registry")

require("mason-lspconfig").setup({})

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
    { name = "nvim_lsp_signature_help" },
  }, { { name = "buffer" } }),
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
  matching = { disallow_symbol_nonprefix_matching = false },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended
local lspconfig = require("lspconfig")

local function isLSP(pkg)
  for _, cat in pairs(pkg.spec.categories) do
    if cat == "LSP" then
      return true
    end
  end
  return false
end

local function loadLSPs()
  local regs = masonReg.get_installed_packages()
  for _, pkg in pairs(regs) do
    if isLSP(pkg) then
      local ali = pkg:get_aliases()[1] or pkg.name
      lspconfig[ali].setup({
        capabilities = capabilities,
      })
    end
  end
end

loadLSPs()

-- lspconfig.vtsls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.eslint.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.vimls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.lua_ls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.docker_compose_language_service.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.jsonls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.yamlls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.sqls.setup({
--   capabilities = capabilities,
-- })
-- lspconfig.fish_lsp.setup({ capabilities = capabilities })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_prev()
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
      tele_builtins.diagnostics({ bufnr = 0 })
    end, opts)
    vim.keymap.set("n", "<leader>pr", function()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name ~= "vtsls"
        end,
        async = true,
      })
    end, opts)
  end,
})

local null_ls = require("null-ls")
-- local cspell = require('cspell')

null_ls.setup({
  --   sources = {
  --     cspell.code_actions,
  --     cspell.diagnostics,
  --     null_ls.builtins.diagnostics.codespell,
  --     -- null_ls.builtins.formatting.codespell,
  --
  --     null_ls.builtins.diagnostics.selene,
  --
  --     -- null_ls.builtins.code_actions.proselint.with({filetypes = {}}),
  --     -- null_ls.builtins.diagnostics.proselint.with({filetypes = {}}),
  --
  --     null_ls.builtins.diagnostics.sqlfluff.with({
  --         extra_args = { "--dialect", "postgres" },
  --     }),
  --     null_ls.builtins.formatting.sqlfluff.with({
  --         extra_args = { "--dialect", "postgres" },
  --     }),
  --
  --     null_ls.builtins.formatting.prettier,
  --
  --     -- null_ls.builtins.formatting.stylua,
  --   }
})

require("none-ls-autoload").setup({
  external_sources = {
    "cspell.code_actions",
    "cspell.diagnostics",
  },
})
