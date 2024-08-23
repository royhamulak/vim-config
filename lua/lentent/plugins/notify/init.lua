local notify = require("notify")
notify.setup({
	background_colour = require("lentent.plugins.onedark.colors").bg0,
	render = "wrapped-compact",
	fps = 120,
	stages = "fade",
	-- max_width = 30,
	timeout = 500,
})

vim.notify = notify
