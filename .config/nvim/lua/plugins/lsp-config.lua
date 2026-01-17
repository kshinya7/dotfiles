return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" },
      automatic_enable = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("ruby_lsp", {
        on_attach = function(client, bufnr)
          client.server_capabilities.semanticTokensProvider = nil
        end,
        reuse_client = function(client, config)
          return client.root_dir == config.root_dir
        end,
      })

      vim.lsp.config("lua_ls", {})

      vim.lsp.enable({ "ruby_lsp", "lua_ls" })
    end,
  }
}
