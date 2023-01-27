vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader>n", "<cmd> set nu! <CR>")
vim.keymap.set("n", "<leader>rn", "<cmd> set rnu! <CR>")

vim.keymap.set("n", "<A-j>", "15jzz")
vim.keymap.set("n", "<A-k>", "15kzz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "F3", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "F2", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<leader>cs", "<cmd>lua require'telescope.builtin'.colorscheme{} <CR>")


vim.keymap.set("v", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>co", "<cmd> Copilot enable <CR>")
vim.keymap.set("n", "<leader>cos", "<cmd> Copilot disable <CR>")

vim.keymap.set("n", "fm", "<cmd> LspZeroFormat <CR>")

vim.keymap.set("n", "<C-o>", "<cmd> SymbolsOutline <CR>")

vim.keymap.set("n", "<C-a>", "^")
vim.keymap.set("n", "<C-e>", "$")


vim.keymap.set("v", "<C-a>", "^")
vim.keymap.set("v", "<C-e>", "$")
