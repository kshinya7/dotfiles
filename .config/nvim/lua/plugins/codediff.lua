return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  opts = {
    highlights = {
      line_insert = "DiffAdd",
      line_delete = "DiffDelete",
      char_insert = "DiffAddText",
      char_delete = "DiffDeleteText",
    },
    explorer = {
      position = "bottom",
      height = 10,
    },
  },
  config = function(_, opts)
    require("codediff").setup(opts)
    vim.api.nvim_create_autocmd("OptionSet", {
      pattern = "diff",
      callback = function()
        vim.wo.wrap = vim.v.option_new == "1"
      end,
    })
  end,
  keys = {
    {
      "<leader>gd",
      "<cmd>CodeDiff<CR>",
      desc = "CodeDiff: working tree",
    },
    {
      "<leader>gh",
      "<cmd>CodeDiff history<CR>",
      desc = "CodeDiff: branch history",
    },
    {
      "<leader>gH",
      "<cmd>CodeDiff history HEAD~100 %<CR>",
      desc = "CodeDiff: file history",
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

        vim.cmd("CodeDiff " .. base .. "...")
      end,
      desc = "CodeDiff: GitHub PR diff",
    },
  },
}
