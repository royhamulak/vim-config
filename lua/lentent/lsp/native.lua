local plugins = {
	createButPlugConfig({ "nvimtools/none-ls.nvim", enabled = false }),
	createButPlugConfig({ "nvimtools/none-ls-extras.nvim", enabled = false }),
	createButPlugConfig({ "zeioth/none-ls-autoload.nvim", enabled = false }),
	createButPlugConfig({
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ensure_installed = {
					-- "cspell",
					"codespell",
					"vtsls",
					"eslint-lsp",
					"prettier",
					"stylua",
				},
			})
		end,
		priority = 999,
		enabled = false,
	}),
	createButPlugConfig({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
		end,
		enabled = false,
	}),
	createButPlugConfig({ "neovim/nvim-lspconfig", enabled = false }),
	createButPlugConfig({ "davidmh/cspell.nvim", enabled = false }),
	createButPlugConfig({ "yioneko/nvim-vtsls", enabled = false }),
	createButPlugConfig({
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp")
		end,
		enabled = false,
	}),
	createButPlugConfig({ "hrsh7th/cmp-nvim-lsp", enabled = false }),
	createButPlugConfig({ "hrsh7th/cmp-buffer", enabled = false }),
	createButPlugConfig({ "hrsh7th/cmp-path", enabled = false }),
	createButPlugConfig({ "hrsh7th/cmp-cmdline", enabled = false }),
	createButPlugConfig({ "hrsh7th/cmp-nvim-lsp-signature-help", enabled = false }),
	createButPlugConfig({ "SergioRibera/cmp-dotenv", enabled = false }),
	createButPlugConfig({ "gbrlsnchs/telescope-lsp-handlers.nvim", enabled = false }),
	createButPlugConfig({ "Bilal2453/luvit-meta", enabled = false }),
	require("lentent.plugins.lspsaga"),
	createButPlugConfig({
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		enabled = false,
	}),
	require("lentent.plugins.neoconf"),
	require("lentent.plugins.lazydev"),
	createButPlugConfig({ "dmmulroy/ts-error-translator.nvim", enabled = false }),
	createButPlugConfig({
		"ndonfris/fish-lsp",
		build = "yarn install",
	}),
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
	nil_ls = {},
}
local _M = {
	plugins = plugins,
}

function _M.setup()
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

	customLspConfigs["nil_ls"]["nil"] = {
		formatting = {
			command = { "nixfmt" },
		},
		nix = {
			flake = {
				autoEvalInputs = true,
				nixpkgsInputName = "nixpkgs",
			},
		},
	}

	require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended

	-- require("lspconfig.configs").nil = require("lspconfig.configs").nil_ls
	local lspconfig = require("lspconfig")

	local function isLSP(pkg)
		for _, cat in pairs(pkg.spec.categories) do
			if cat == "LSP" then
				return true
			end
		end
		return false
	end

	local al = {}
	al["lua-language-server"] = { "lua_ls" }
	al["nil"] = { "nil_ls" }
	masonReg.register_package_aliases(al)
	-- local al = {
	--   "lua-language-server" = {"lua_ls"},
	--   "nil" = {"nil_ls"},
	--   }
	-- -- masonReg.register_package_aliases({
	--   ["lua-language-server"] = ["lua_ls"],
	--   ["nil"] = ["nil_ls"]
	-- })

	local function loadLSPs(caps)
		local regs = masonReg.get_installed_packages()
		for _, pkg in pairs(regs) do
			if isLSP(pkg) then
				local ali = masonReg.get_package_aliases(pkg.name)[1] or pkg.name
				-- print(vim.inspect(pkg))
				-- local customCaps = vim.table.
				if not customLspConfigs[ali] then
					lspconfig[ali].setup({ capabilities = caps })
				else
					lspconfig[ali].setup({ capabilities = caps, settings = customLspConfigs[ali] })
				end
				vim.lsp.enable(ali)
			end
		end
	end

	masonReg.update(function()
		loadLSPs(capabilities)
	end)
	-- vim.lsp.enable("lua_ls")
	-- vim.lsp.enable("nil_ls")

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
			-- cspell.code_actions,
			-- cspell.diagnostics,
			null_ls.builtins.diagnostics.codespell,
			null_ls.builtins.formatting.codespell,
			--
			null_ls.builtins.diagnostics.selene,
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

			null_ls.builtins.formatting.nixfmt,
			--
			--     -- null_ls.builtins.formatting.stylua,
		},
	})
end

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

-- require("none-ls-autoload").setup({
--   external_sources = {
--     "cspell.code_actions",
--     "cspell.diagnostics",
--   },
-- })
--
return _M
