--line number
vim.cmd[[set rnu!]]
vim.cmd[[set nu!]]
--Making tab move 4 cells
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
        
--Always 8 more line below cursor
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

--Cursor
vim.opt.cursorline = true

--clipboard
vim.opt.clipboard:append("unnamedplus")

--Copliot
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ""

vim.api.nvim_set_keymap("i", "<A-/>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
