return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  opts = {
    ensure_installed = {
      "lua",
      "javascript",
      "ruby",
      "bash",
      "vim",
      "eruby",
      "html",
      "css",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

