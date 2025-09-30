return {
  require("lentent.plugins.fzf"),
  require("lentent.plugins.fzf-nvim"),
  require("lentent.plugins.illuminate"),
  require("lentent.plugins.plenary"),
  require("lentent.plugins.fix-cursor-hold"),
  createButPlugConfig({ "tpope/vim-surround" }),
  createButPlugConfig({ "tomtom/tcomment_vim" }),
  createButPlugConfig({ "iamcco/markdown-preview.nvim", build = "cd app && npx --yes yarn install" }),
  createButPlugConfig({ "tpope/vim-fugitive" }),
  createButPlugConfig({ "sindrets/diffview.nvim" }),
  createButPlugConfig({
    "kkoomen/vim-doge",
    build = function()
      vim.fn["doge#install"]()
    end,
  }),
  createButPlugConfig({ "MunifTanjim/nui.nvim" }),
  createButPlugConfig({ "stevearc/dressing.nvim" }),
  createButPlugConfig({ "dmmulroy/ts-error-translator.nvim" }),
  require("lentent.plugins.nvim-web-devicons"),
  require("lentent.plugins.bufferline"),
  require("lentent.plugins.lualine"),
  require("lentent.plugins.onedark"),
  require("lentent.plugins.colorizer"),
  require("lentent.plugins.treesitter"),
  require("lentent.plugins.treesitter.syntax-tree-surfer"),
  require("lentent.plugins.gitsigns"),
  require("lentent.plugins.nvim-tree"),
  require("lentent.plugins.notify"),
  require("lentent.plugins.nvim-test"),
  require("lentent.plugins.textcase"),
  require("lentent.plugins.arrow"),
  require("lentent.plugins.telescope"),
  require("lentent.plugins.noice"),
  require("lentent.plugins.precognition"),
  require("lentent.plugins.ufo"),
  require("lentent.plugins.attempt"),
  createButPlugConfig({
    "OXY2DEV/helpview.nvim",
    lazy = false, -- Recommended
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  }),
  -- createButPlugConfig({
  --   "danymat/neogen",
  --   config = true,
  --   -- Uncomment next line if you want to follow only stable versions
  --   -- version = "*"
  -- }),
  createButPlugConfig({
    "LunarVim/bigfile.nvim",
    config = function()
      require("bigfile").setup({})
    end,
  }),
  createButPlugConfig({
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  }),
  require("lentent.plugins.octo"),
  -- require("lentent.plugins.recorder"),
  -- createButPlugConfig({ "neoclide/npm.nvim", build = "npm install", dependencies = "Shougo/denite.nvim" }),
  -- require("lentent.plugins.neo-composer"),
  -- require("lentent.plugins.lspsaga"),
  -- require("lentent.plugins.regex-railroad"),
  -- require("lentent.plugins.mini.indentscope"),
  -- require("lentent.plugins.possessions"),
  -- require("lentent.plugins.treesitter.textobjects"),
  -- createButPlugConfig({
  --   "ggandor/leap.nvim",
  --   config = function()
  --     require('leap').set_default_mappings()
  --     vim.keymap.set({ "x", "o" }, "R", function()
  --       require("leap.treesitter").select({
  --         -- To increase/decrease the selection in a clever-f-like manner,
  --         -- with the trigger key itself (vRRRRrr...). The default keys
  --         -- (<enter>/<backspace>) also work, so feel free to skip this.
  --         opts = require("leap.user").with_traversal_keys("R", "r"),
  --       })
  --     end)
  --   end,
  -- }),
  createButPlugConfig({
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
        },
      },
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
    },
  }),
}
