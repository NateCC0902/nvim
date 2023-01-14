
vim.keymap.set('n', '<C-f>', ":let b:caret=winsaveview() <CR> | :%SnipRun <CR>| :call winrestview(b:caret) <CR>", {})
vim.keymap.set("n", "<C-s>", "<Cmd>SnipClose<CR>")

vim.api.nvim_set_keymap('v', 'f', '<Plug>SnipRun', {silent = true})

require'sniprun'.setup({
    display = { "Terminal" },
    display_options = {
        terminal_width = 45,
    },
})

