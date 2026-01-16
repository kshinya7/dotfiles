return {
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>gd",
      "<cmd>:DiffviewOpen<CR>",
      desc = "Diffview: working tree vs HEAD"
    },
    {
      "<leader>gq",
      "<cmd>DiffviewClose<CR>",
      desc = "Diffview: close",
    },
    {
      "<leader>gh",
      "<cmd>DiffviewFileHistory<CR>",
      desc = "Diffview: branch history",
    },
    {
      "<leader>gH",
      "<cmd>DiffviewFileHistory %<CR>",
      desc = "Diffview: file history",
    },
  }
}
