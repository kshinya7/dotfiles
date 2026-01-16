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
    {
      "<leader>gp",
      function()
        local handle = io.popen(
          "gh pr view --json baseRefOid -q .baseRefOid 2>/dev/null"
        )
        if not handle then
          vim.notify("Failed to run gh", vim.log.levels.ERROR)
          return
        end

        local base = handle:read("*a")
        handle:close()

        base = base:gsub("%s+", "")
        if base == "" then
          vim.notify("Not on a PR branch", vim.log.levels.WARN)
          return
        end

        vim.cmd("DiffviewOpen " .. base .. "...HEAD")
      end,
      desc = "Diffview: GitHub PR diff",
    },
  },
}
