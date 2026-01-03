return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,

  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          dir = vim.loop.cwd(),
          reveal = vim.api.nvim_buf_get_name(0),
        })
      end,
      desc = "Toggle NeoTree",
    },
  },

  config = function(_, opts)
    require("neo-tree").setup(vim.tbl_deep_extend("force", {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
        renderers = {
          directory = {
            { "indent" },
            { "icon" },
            { "name" },
            { "git_status" },
          },
          file = {
            { "indent" },
            { "icon" },
            { "name" },
            { "git_status" },
          },
          symlink = {
            { "indent" },
            { "icon" },
            { "name" },
            { "git_status" },
          },
        },
        window = {
          position = "right",
        },
      },
    }, opts or {}))
  end,
}

