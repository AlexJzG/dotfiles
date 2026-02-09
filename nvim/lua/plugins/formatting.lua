return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true }, function()
            vim.cmd("silent! noautocmd retab")
          end)
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettier" },
        tex = { "latexindent" },
        make = { "bake" },
        gitcommit = { "gitlint" },
      },
      -- Set up format-after-save
      format_after_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        local opts = { lsp_format = "fallback" }

        local cb = function(err, did_edit)
          if err then
            vim.notify("Formatting failed: " .. tostring(err), vim.log.levels.ERROR)
            return
          end
          if not vim.api.nvim_buf_is_valid(bufnr) then
            return
          end

          vim.api.nvim_buf_call(bufnr, function()
            vim.cmd("silent! noautocmd retab")
            vim.cmd("silent! noautocmd write")
          end)
        end

        return opts, cb
      end,
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the 'formatexpr' to be set to conform (for gq)
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
