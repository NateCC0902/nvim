require("transparent").setup({
    extra_groups = { -- table/string: additional groups that should be cleared
        -- In particular, when you set it to 'all', that means all available groups
        -- example of akinsho/nvim-bufferline.lua
        'NvimTreeNormal',
        'NvimTreeStatuslineNc',
        "barbecue",
        'ufoNormal',
    },
    exclude_groups = {
        "NormalNC",
    }, -- table: groups you don't want to clear
})
