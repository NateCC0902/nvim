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


vim.keymap.set("i", "<C-a>", "<C-o>^", { noremap = true, silent = false })
vim.keymap.set("i", "<C-e>", "<Esc>A", { noremap = true, silent = true })

vim.keymap.set("i", "<C-w>", "<C-o>db", { noremap = true, silent = false })
vim.keymap.set("i", "<C-b>", "<C-o>dw", { noremap = true, silent = false })

vim.keymap.set("i", "<C-,>", "<C-o>b", { noremap = true, silent = false })
vim.keymap.set("i", "<C-.>", "<C-o>w", { noremap = true, silent = false })


vim.keymap.set("v", "<C-a>", "^", { noremap = true, silent = false })
vim.keymap.set("v", "<C-e>", "$", { noremap = true, silent = true })

vim.keymap.set('n', '<C-w>', ':w<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>wq', ':wq<CR>', { noremap = true, silent = false })


vim.keymap.set('n', '<C-+>', ':vertical resize +10<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-_>', ':vertical resize -10<CR>', { noremap = true, silent = false })

vim.keymap.set('i', '<A-->', '<Plug>(copilot-next)')
vim.keymap.set('i', '<A-=>', '<Plug>(copilot-previous)')

vim.keymap.set('i', '<A-h>', '<Left>')
vim.keymap.set('i', '<A-j>', '<Down>')
vim.keymap.set('i', '<A-k>', '<Up>')
vim.keymap.set('i', '<A-l>', '<Right>')

-- Zen
vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<A-CR>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Bufferline
--
-- Move to previous/next
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<C-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<C->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
--map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--           vim.keymap.set('i', '<A-h>', '<Left>')      :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Code runnder
vim.keymap.set('n', '<C-f>', ":RunCode <CR>", { noremap = true, silent = false })
vim.keymap.set('n', '<C-s>', ':RunClose<CR>', { noremap = true, silent = false })
-- Troble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })


--outline
--[[ keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<S-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = {"za", "h"},
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  } ]]

-- treesj reannge array
vim.keymap.set('n', 'zs', require('treesj').toggle)

-- nvim-tree
vim.keymap.set("n", "<C-t>", "<cmd> NvimTreeToggle <CR>")
vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeFocus <CR>")

--  Hop
vim.keymap.set('', 's', ':HopWord<CR>', { noremap = true })
vim.keymap.set('', 'S', ':HopPattern<CR>', { noremap = true })

-- goto preview

vim.keymap.set("n", "<leader>v", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.keymap.set("n", "<leader>t", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", {noremap=true})
vim.keymap.set("n", "<leader>r", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", {noremap=true})
vim.keymap.set("n", "<leader>i", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", {noremap=true})
vim.keymap.set("n", "<leader>c", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
