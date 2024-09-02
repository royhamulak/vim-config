return {
	plugged = function()
		local mapKeys = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
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
	end,
}
