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
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
        lisp = {
            "cd $dir &&",
            "sbcl --script $fileName",
        } 
    },
    project = {
        ["~/IdeaProjects/JavaLeetcode/my-app"] = {
            name = "JavaProjectPlayground",
            description = "A Simple Project",
            command = "mvn clean compile exec:java",
        }
    },
})
