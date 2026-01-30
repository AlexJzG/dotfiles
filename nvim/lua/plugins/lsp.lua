return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "clangd", "pyright", "texlab" },
        handlers = {
          -- Default handler
          function(server_name)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- Custom clangd handler
          ["clangd"] = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig").clangd.setup({
              capabilities = capabilities,
              cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
                "--fallback-style=llvm",
                "--query-driver=/usr/bin/g++,/usr/bin/gcc", -- Use GCC headers
              },
            })
          end,
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local function map(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Go to Definition")
          map("gr", vim.lsp.buf.references, "Go to References")
          map("gI", vim.lsp.buf.implementation, "Go to Implementation")
          map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          vim.keymap.set(
            { "n", "v" },
            "<leader>ca",
            vim.lsp.buf.code_action,
            { buffer = ev.buf, desc = "LSP: Code Action" }
          )
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gD", vim.lsp.buf.declaration, "Go to Declaration")
        end,
      })
    end,
  },
}
