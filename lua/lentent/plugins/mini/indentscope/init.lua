return createButPlugConfig({
	"echasnovski/mini.indentscope",
	config = function()
		require("mini.indentscope").setup({
			draw = {
				animation = require("mini.indentscope").gen_animation.none(),
			},
		})
	end,
})
