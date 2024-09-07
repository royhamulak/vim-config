return createButPlugConfig({
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
      lightbulb = {
        enable = false
      },
      code_action = {
        show_server_name = true,
        extend_gitsigns = true,
      }
    })
	end,
  keys = {
    {'ff', ':Lspsaga finder<cr>'},
    {'fi', ':Lspsaga incoming_calls<cr>'},
    {'fo', ':Lspsaga outgoing_calls<cr>'},
    {'<leader>o', ':Lspsaga outline<cr>'},
    {'<leader>dl', ':Lspsaga show_buf_diagnostics<cr>'}, 
  },
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
})
