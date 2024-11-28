vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
-- vim.api.nvim_create_user_command("NpmInstall", function(opts)
-- 	print(vim.inspect(opts))
-- 	local command = {
-- 		"hor",
-- 		"bo",
-- 		vim.fn.join({
-- 			"+term",
-- 			"npm",
-- 			"install",
-- 			unpack((opts.fargs or {})),
-- 		}, "\\ "),
-- 	}
-- 	print(vim.inspect(command))
-- 	print(vim.fn.join(command, " "))
-- 	vim.cmd(vim.fn.join(command, " "))
-- 	-- 	vim.cmd([[
-- 	-- hor bo sv +term\ npm\ install
-- 	--   ]] .. )
-- end, { desc = "run npm install", nargs = "*" })
-- vim.o.foldmethod='expr'

vim.filetype.add({
	extension = {
		mdx = "javascriptreact",
		yml = "yaml",
	},
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
	},
})

require("but-plug")
	.setup({
		plugins = require("lentent.plugins"),
	})
	.but("lazy")
-- require('lentent.plugin-managers.lazy')

-- require("lentent.plugins")

-- require("lentent.plugins.render-markdown")
--
-- require("lentent.plugins.regex-railroad")

-- require("mini.indentscope").setup({
-- 	draw = {
-- 		animation = require("mini.indentscope").gen_animation.none(),
-- 	},
-- })

-- require("neotest").setup({
--   adapters = {
--     require("neotest-jest")({
--       jestCommand = "npm run test:jest --",
--       -- jestConfigFile = function()
--       --   local file = vim.fn.expand('%:p')
--       --   if string.find(file, "/packages/") then
--       --     return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
--       --   end
--       --
--       --   return vim.fn.getcwd() .. "/jest.config.ts"
--       -- end,
--       -- cwd = function ()
--       --   return vim.fn.getcwd()
--       -- end,
--       jest_test_discovery = true,
--     })
--   },
--   summary = {
--     mappings = {
--       expand = "e",
--       expand_all = "E",
--     },
--     open = "botright vsplit | vertical resize 80"
--   },
--   discovery = {
--     enabled = false,
--     filter_dir = function(name, rel_path)
--       if string.find(rel_path, "test") then
--         vim.print("yes " .. rel_path)
--         return true
--       end
--       vim.print("no " .. rel_path)
--       -- vim.print(root)
--       return false
--     end
--   },
--   -- output = {
--   --   enabled = true,
--   --   open_on_run = true,
--   -- },
--   -- status = {
--   --   enabled = true,
--   --   virtual_text = true,
--   -- },
--   -- state = {
--   --   enabled = true,
--   -- },
-- })
--
--
-- mapKeys("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", opts)
-- mapKeys("n", "<leader>ta", "<cmd>Neotest attach<CR>", opts)
-- mapKeys("n", "<leader>to", "<cmd>lua require('neotest').output.open({last_run=true})<CR>", opts)
-- mapKeys("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'npm run test:jest -- --watch' })<CR>", opts)
-- mapKeys("n", "<leader>tt", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), jestCommand = 'npm run test:jest -- --watch' })<CR>", opts)
-- mapKeys("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", opts)
--
-- mapKeys("n", "]t", "<cmd>lua require('neotest').jump.next()<CR>", opts)
-- mapKeys("n", "[t", "<cmd>lua require('neotest').jump.prev()<CR>", opts)

-- require('hlargs').setup({
--   color = onedarkColors.yellow,
--   paint_catch_blocks = {
--     declarations = true,
--     usages = true,
--   },
--   extras = {
--     named_parameters = true,
--   },
-- })

-- require("marks").setup({
-- })
-- require("hardtime").setup()

-- Native LSP stuff
--

-- require('fidget').setup({})
-- require('dressing').setup({
--   select = {
--     backend = {
--       "nui",
--       "fzf_lua",
--       "telescope",
--       "fzf",
--       "builtin"
--    },
--   }
-- })

-- require("mason").setup({
-- 	ensure_installed = {
-- 		"cspell",
-- 		--"codespell",
-- 		"vtsls",
-- 		"eslint-lsp",
-- 		"prettier",
-- 		"stylua",
-- 	},
-- })
--
local masonReg = require("mason-registry")

-- require("mason-lspconfig").setup({})

local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "nvim_lsp_signature_help" },
		-- {name = "buffer"}
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local customLspConfigs = {
	vtsls = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
			-- experimental = {
			-- 	completion = {
			-- 		enableServerSideFuzzyMatch = true,
			-- 	},
			-- },
		},
		javascript = {
			preferences = {
				quoteStyle = "single",
				importModuleSpecifierEnding = "js",
			},
			referencesCodeLens = {
				enabled = true,
				showOnAllFunction = true,
			},
			inlayHints = {
				-- parameterNames = {
				-- 	enabled = "all",
				-- },
				-- parameterTypes = {
				-- 	enabled = true,
				-- },
				-- variableTypes = {
				-- 	enabled = true,
				-- },
				-- propertyDeclarationTypes = {
				-- 	enabled = true,
				-- },
				-- functionLikeReturnTypes = {
				-- 	enabled = true,
				-- },
				-- enumMemberValues = {
				-- 	enabled = true,
				-- },
			},
		},
		typescript = {
			-- preferGoToSourceDefinition = true,
			workspaceSymbols = {
				scope = "currentProject",
			},
			preferences = {
				quoteStyle = "single",
				importModuleSpecifierEnding = "js",
				preferTypeOnlyAutoImports = true,
			},
			referencesCodeLens = {
				enabled = true,
				showOnAllFunction = true,
			},
			inlayHints = {
				-- parameterNames = {
				-- 	enabled = "all",
				-- },
				-- parameterTypes = {
				-- 	enabled = true,
				-- },
				-- variableTypes = {
				-- 	enabled = true,
				-- },
				-- propertyDeclarationTypes = {
				-- 	enabled = true,
				-- },
				-- functionLikeReturnTypes = {
				-- 	enabled = true,
				-- },
				-- enumMemberValues = {
				-- 	enabled = true,
				-- },
			},
			suggest = {
				completeFunctionCalls = true,
			},
			implementationsCodeLens = {
				enabled = true,
				showOnInterfaceMethods = true,
			},
		},
	},
}

require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended

local lspconfig = require("lspconfig")

local function isLSP(pkg)
	for _, cat in pairs(pkg.spec.categories) do
		if cat == "LSP" then
			return true
		end
	end
	return false
end

local function loadLSPs(caps)
	local regs = masonReg.get_installed_packages()
	for _, pkg in pairs(regs) do
		if isLSP(pkg) then
			local ali = pkg:get_aliases()[1] or pkg.name

			-- local customCaps = vim.table.
			if not customLspConfigs[ali] then
				lspconfig[ali].setup({ capabilities = caps })
			else
				lspconfig[ali].setup({ capabilities = caps, settings = customLspConfigs[ali] })
			end
		end
	end
end

loadLSPs(capabilities)

-- lspconfig.vtsls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.eslint.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.vimls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.lua_ls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.docker_compose_language_service.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.jsonls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.yamlls.setup({
--   capabilities = capabilities,
-- })
--
-- lspconfig.sqls.setup({
--   capabilities = capabilities,
-- })
lspconfig.fish_lsp.setup({ capabilities = capabilities })

local lspAUGroup = vim.api.nvim_create_augroup("UserLspConfig", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = lspAUGroup,
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		local bufnr = ev.buf
		-- local client = vim.lsp.get_client_by_id(ev.data.client_id)
		-- if client.server_capabilities.completionProvider then
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
		-- end
		-- if client.server_capabilities.definitionProvider then
		vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
		-- end
		-- vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

		-- vim.api.nvim_create_autocmd({ "LspTokenUpdate", "BufEnter", "FocusGained" }, {
		-- 	callback = function(_ev)
		-- 		vim.lsp.codelens.refresh({ bufnr = _ev.buf })
		-- 	end,
		-- })

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev()
		end, opts)

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		-- vim.keymap.set({ 'n', 'v' }, '<leader>ac', actionPreview.code_actions, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set('n', 'gr', tele_builtins.lsp_references, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		vim.keymap.set("n", "<leader>ld", function()
			require("telescope.builtin").diagnostics({ bufnr = 0 })
		end, opts)
		vim.keymap.set("n", "<leader>pr", function()
			vim.lsp.buf.format({
				filter = function(_client)
					return _client.name ~= "vtsls"
				end,
				async = true,
			})
		end, opts)
	end,
})

-- vim.api.nvim_create_autocmd("LspDetach", {
-- 	group = lspAUGroup,
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		-- Do something with the client
-- 		vim.cmd("setlocal tagfunc< omnifunc<")
-- 	end,
-- })

local null_ls = require("null-ls")
-- local cspell = require('cspell')

null_ls.setup({
	sources = {
		--     cspell.code_actions,
		--     cspell.diagnostics,
		--     null_ls.builtins.diagnostics.codespell,
		--     -- null_ls.builtins.formatting.codespell,
		--
		--     null_ls.builtins.diagnostics.selene,
		--
		--     -- null_ls.builtins.code_actions.proselint.with({filetypes = {}}),
		--     -- null_ls.builtins.diagnostics.proselint.with({filetypes = {}}),
		--
		null_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "snowflake" },
		}),
		null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "snowflake" },
		}),
		--
		--     -- null_ls.builtins.formatting.stylua,
	},
})

require("none-ls-autoload").setup({
	external_sources = {
		-- "cspell.code_actions",
		-- "cspell.diagnostics",
	},
})
