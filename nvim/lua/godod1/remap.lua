vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In visual mode use J and K to move elements up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Stay cursor as is when contatenate lines
vim.keymap.set("n", "J", "mzJ`z")

-- Jump over page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When you search word stay cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Indent files
vim.keymap.set("n", "=ap", "ma=ap'a")

-- Paste previously copied word and move highlighted word to void register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>dv", '"_d')

-- Format files
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ bufnr = 0 })
end)

-- Replace word where cursor on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Generate docstrings
vim.keymap.set("n", "<leader>cds", ":lua require('neogen').generate()<CR>")
