return createButPlugConfig({
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    -- or if using `mini.icons`
    -- { "echasnovski/mini.icons" },
  },
  opts = {
    always_show_path = true,
    show_icons = true,
    leader_key = "\\",
  },
})
