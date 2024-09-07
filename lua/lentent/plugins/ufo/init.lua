return createButPlugConfig({
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
	},
	init = function()
		vim.cmd([[
hi default link UfoPreviewSbar PmenuSbar
hi default link UfoPreviewThumb PmenuThumb
hi default link UfoPreviewWinBar UfoFoldedBg
hi default link UfoPreviewCursorLine Visual
hi default link UfoFoldedEllipsis Comment
hi default link UfoCursorFoldedLine CursorLine
]])
	end,
	keys = {
		{
			"zR",
			function()
				return require("ufo").openAllFolds()
			end,
		},
		{
			"zM",
			function()
				return require("ufo").closeAllFolds()
			end,
		},
		{
			"K",
			function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					-- choose one of coc.nvim and nvim lsp
					vim.lsp.buf.hover()
				end
			end,
		},
	},
	opts = {
		close_fold_kinds_for_ft = {
			default = { "imports", "comment" },
			typescript = { "imports", "comment" },
		},
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
		fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end,
	},
})
