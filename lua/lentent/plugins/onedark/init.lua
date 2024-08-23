require("onedark").setup({
	style = "warmer",
	transparent = true,
	highlights = {
		["@type"] = { fg = "$red" },
		["@variable.parameter"] = { fg = "$yellow" },
	},
})

require("onedark").load()

return {
  "navarasu/onedark.nvim",
  config = function ()
    require('onedark').setup({
        style = 'warmer',
        transparent = true,
        highlights = {
          ["@type"] = {fg = '$red'},
          ["@variable.parameter"] = {fg= '$yellow'},
        },
    })
    vim.cmd('colorscheme onedark')
  end
}
