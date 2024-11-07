return createButPlugConfig({
	"ecthelionvi/NeoComposer.nvim",
	dependencies = { "kkharji/sqlite.lua" },
	opts = {
		keymaps = {
			cycle_next = "<c-q>",
			cycle_prev = "<c-S-q>",
		},
	},
})
