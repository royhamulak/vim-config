local terminal_group = vim.api.nvim_create_augroup("terminals", {
  clear = false,
})

local function keymap(buf, lhs, rhs)
  vim.keymap.set("t", lhs, rhs, { buffer = buf, silent = true, noremap = true })
end

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  group = terminal_group,
  pattern = "term://*",
  command = "startinsert",
})

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  group = terminal_group,
  pattern = "term://*",
  callback = function(ev)
    keymap(ev.buf, "<C-ESC>", "<C-\\><C-n>")
    keymap(ev.buf, "<C-h>", "<C-\\><C-n><C-w>h")
    keymap(ev.buf, "<C-j>", "<C-\\><C-n><C-w>j")
    keymap(ev.buf, "<C-k>", "<C-\\><C-n><C-w>k")
    keymap(ev.buf, "<C-l>", "<C-\\><C-n><C-w>l")
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, { group = terminal_group, pattern = "term://*", command = "stopinsert" })
