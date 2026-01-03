return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      highlight = "IblIndent",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      highlight = "IblScope",
    },
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2a2a3a", nocombine = true })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#4a4a55", nocombine = true })
    require("ibl").setup(opts)
  end,
}

