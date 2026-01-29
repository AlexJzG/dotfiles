return {
  {
    "lervag/vimtex",
    lazy = false, -- Vimtex recommends not lazy-loading
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },
}
