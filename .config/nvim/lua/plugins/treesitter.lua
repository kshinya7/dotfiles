return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  opts = {
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
    highlight = { enable = true, additional_vim_regex_highlighting = false, },
    indent = { enable = true },
  },
}

