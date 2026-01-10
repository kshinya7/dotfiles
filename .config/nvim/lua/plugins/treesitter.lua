return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  opts = {
    ensure_installed = {
      "lua",
      "bash",
      "vim",

      -- Ruby / Rails
      "ruby",
      "eruby",       -- .html.erb
      "embedded_template",
      "html",
      "css",
      "javascript",
      "json",
      "yaml",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

