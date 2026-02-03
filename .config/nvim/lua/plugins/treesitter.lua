return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua",
        "bash",
        "vim",
        "ruby",
        "eruby",
        "embedded_template",
        "html",
        "css",
        "javascript",
        "json",
        "yaml",
      },
    })

    -- Enable treesitter highlighting and indent
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}

