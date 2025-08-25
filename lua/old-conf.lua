-- vim.lsp.set_log_level("info")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("lentent.clipboard")

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

local butPlug = require("but-plug")
local lsp = require("lentent.lsp")

butPlug
    .setup({
      plugins = vim.list_extend(require("lentent.plugins"), lsp.plugins),
    })
    .but("lazy")

lsp.setup({ "nixd", "lua_ls", "vtsls", "fish_lsp", "jsonls", "yamlls", "tombi" })

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
