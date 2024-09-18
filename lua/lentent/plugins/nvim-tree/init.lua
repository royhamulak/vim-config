return createButPlugConfig({
  "nvim-tree/nvim-tree.lua",
  priority = 1000,
  config = function()
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function _opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.del("n", "<C-x>", { buffer = bufnr })
      -- vim.keymap.del('n', '<2-LeftMouse>', { buffer = bufnr })
      -- vim.keymap.del('n', '<2-RighMouse>', { buffer = bufnr })
      vim.keymap.set("n", "<C-s>", api.node.open.horizontal, _opts("Open: Horizontal Split"))
      vim.keymap.set("n", "?", api.tree.toggle_help, _opts("Help"))
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
        indent_markers = {
          enable = true,
        },
        icons = {
          web_devicons = {
            folder = {
              enable = true,
            },
          },
        },
      },
      -- sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        -- update_root = {
        --   enable = true,
        -- },
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
  end,
})
