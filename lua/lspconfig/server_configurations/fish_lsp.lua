local util = require("lspconfig.util")

return {
	default_config = {
		cmd = { "fish-lsp", "start" },
		filetypes = { "fish" },
		root_dir = util.root_pattern(".fishrc", ".fishrc.fish"),
		single_file_support = true,
		settings = {
			workspaces = {
				paths = {
					defaults = { "$HOME/.config/fish", "/usr/share/fish" },
				},
			},
		},
	},
}
