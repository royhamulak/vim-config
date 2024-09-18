local function peekOrHover()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if winid then
		local bufnr = vim.api.nvim_win_get_buf(winid)
		local keys = { "a", "i", "o", "A", "I", "O", "gd", "gr" }
		for _, k in ipairs(keys) do
			-- Add a prefix key to fire `trace` action,
			-- if Neovim is 0.8.0 before, remap yourself
			vim.keymap.set("n", k, "<CR>" .. k, { noremap = false, buffer = bufnr })
		end
	else
		vim.lsp.buf.hover()
	end
end

local function goPreviousClosedAndPeek()
	require("ufo").goPreviousClosedFold()
	require("ufo").peekFoldedLinesUnderCursor()
end

local function goNextClosedAndPeek()
	require("ufo").goNextClosedFold()
	require("ufo").peekFoldedLinesUnderCursor()
end

local function inspectNumberOfLines(virtText, lnum, endLnum, width, truncate)
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
end

return createButPlugConfig({
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
		-- "lewis6991/async.nvim",
	},
	init = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	config = function()
		require("ufo").setup({
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					jumpTop = "[",
					jumpBot = "]",
				},
			},
			open_fold_hl_timeout = 400,
			enable_get_fold_virt_text = true,
			close_fold_kinds_for_ft = {
				default = { "imports" },
			},
			fold_virt_text_handler = inspectNumberOfLines,
		})
		vim.cmd([[
hi default UfoFoldedFg guifg=Normal.foreground
hi default UfoFoldedBg guibg=Folded.background
hi default link UfoPreviewSbar PmenuSbar
hi default link UfoPreviewThumb PmenuThumb
hi default link UfoPreviewWinBar UfoFoldedBg
hi default link UfoPreviewCursorLine Visual
hi default link UfoFoldedEllipsis Comment
hi default link UfoCursorFoldedLine CursorLine
]])
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
		vim.keymap.set("n", "<S-tab>k", goPreviousClosedAndPeek)
		vim.keymap.set("n", "<S-tab>j", goNextClosedAndPeek)
		vim.keymap.set("n", "<C-S-K>", peekOrHover)
	end,
})
