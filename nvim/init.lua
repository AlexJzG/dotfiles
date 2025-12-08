require("config.keys.keymaps") -- Basic Keymaps
require("config.options")
require("config.lazy")
require("config")

-- Load Snippets
require("luasnip.loaders.from_snipmate").lazy_load({paths = "./lua/snippets"})

-- Terminal Setup
require("toggleterm").setup{
    size = 13,
}

-- Comments
require('Comment').setup{
    toggler = { line = '<leader>c ', block = '<leader>b ' },
    opleader = { line = '<leader>c ', block = '<leader>b ' },
    extra = { above = '<leader>cO', below = '<leader>co', eol = '<leader>cA' },
}

-- Colors
require'colorizer'.setup()

-- This module contains a number of default definitions
local rainbow_delimiters = require('rainbow-delimiters')
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = { [''] = 'rainbow-delimiters', lua = 'rainbow-blocks', },
    priority = { [''] = 110, lua = 210, },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}

-- Git
require('gitsigns').setup()

-- For HTML files

vim.api.nvim_create_autocmd({
    "FileType",
},{
    pattern = {"html", "css", "js"},
    callback = function(args)
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})
