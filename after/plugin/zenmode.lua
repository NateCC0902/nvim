vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', { noremap = true, silent = true })

require("zen-mode").setup {
    window = {
        width = 130,
        options = {
            number = true,
            relativenumber = false,
        },
    },
}
