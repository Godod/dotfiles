require("godod1.set")
require("godod1.remap")
require("godod1.lazy_init")


local augroup = vim.api.nvim_create_augroup
local grp = augroup("godod1", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd("BufWritePre", {
    group = grp,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


autocmd("LspAttach", {
    group = grp,
    callback = function(e)
        local opts = { buffer = e.buf }
        local set = vim.keymap.set

        set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        set("n", "K", function() vim.lsp.buf.hover() end, opts)
        set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
