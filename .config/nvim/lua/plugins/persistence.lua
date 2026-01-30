return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    pre_save = function()
      return vim.fn.finddir(".git", ".;") ~= ""
    end,
  },
  keys = {
    { "<leader>Sr", function() require("persistence").load() end, desc = "Restore session" },
    { "<leader>Sl", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
    { "<leader>Sd", function() require("persistence").stop() end, desc = "Don't save session" },
  },
}
