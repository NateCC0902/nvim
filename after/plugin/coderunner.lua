require('code_runner').setup({
    -- put here the commands by filetype
    mode = "term",
    focus = false,
    startinsert = false,
    term = {
        position = "vert",
        size = 60,
    },
    filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        python = "python3 -u",
        typescript = "ts-node",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
    },

    project = {
        ["~/IdeaProjects/JavaLeetcode/HelloWorld"] = {
            name = "JavaProjectPlayground",
            description = "A Simple Project",
            command = "mvn exec:java",
        }
    },

})

vim.keymap.set('n', '<C-f>', ":RunCode <CR>", { noremap = true, silent = false })
vim.keymap.set('n', '<C-s>', ':RunClose<CR>', { noremap = true, silent = false })
