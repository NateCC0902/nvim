require('code_runner').setup({
    -- put here the commands by filetype
    mode = "term",
    focus = false,
    startinsert = false, 
    term = {
        position = "vert",
        size = 50,
    },
    filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        python = "python3 -u",
        typescript = "ts-node",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
    },

})

vim.keymap.set('n', '<C-f>', ':w<CR>:RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-s>', ':RunClose<CR>', { noremap = true, silent = false })
