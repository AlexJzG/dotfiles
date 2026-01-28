return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {},
        config = function()
            require("nvim-treesitter.config").setup({
                ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "typescript", "tsx", "c", "cpp", "python" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = true,
    },
}