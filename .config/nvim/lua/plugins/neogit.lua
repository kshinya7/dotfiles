return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "esmuellert/codediff.nvim",
    "ibhagwan/fzf-lua",
  },
  cmd = "Neogit",
  opts = {
    diff_viewer = "codediff",
  },
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
  }
}
