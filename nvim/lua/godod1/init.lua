require("godod1.set")
require("godod1.remap")
require("godod1.lazy_init")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("local-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
