require("transparent").setup({
    enable = false, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be cleared
        -- In particular, when you set it to 'all', that means all available groups
        -- example of akinsho/nvim-bufferline.lua
        'NvimTreeNormal',
        'NvimTreeStatuslineNc',
        "barbecue",
        'ufoNormal',
    },
    exclude = {
        "NormalNC",
    }, -- table: groups you don't want to clear
})
