return {
    { "nvim-tree/nvim-web-devicons", opts = {} },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
  },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto", -- Automatically matches your colorscheme
                    globalstatus = true, -- Have a single statusline at the bottom instead of one per window
                },
            })
        end,
    },
    {
          "serhez/teide.nvim",
          lazy = false,
          priority = 1000,
          opts = {},
          config = function()
            require('teide').setup({
              style = "darker",
              transparent = true,
              dim_inactive = true,
            })
            vim.cmd([[ colorscheme teide ]])
          end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    }
}
