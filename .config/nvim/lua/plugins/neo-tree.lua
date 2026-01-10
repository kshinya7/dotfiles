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
      "<leader>ef",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          dir = vim.loop.cwd(),
          reveal = vim.api.nvim_buf_get_name(0),
        })
      end,
      desc = "Toggle NeoTree",
    },
    {
      "<leader>eb",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          source = "buffers",
          dir = vim.loop.cwd(),
          reveal = vim.api.nvim_buf_get_name(0),
        })
      end,
      desc = "Toggle NeoTree",
    },
  },

  opts = {
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
    buffers = {
      follow_current_file = true,
      group_empty_dirs = true,
      show_unloaded = true,
      window = {
        position = "right",
      },
    },
    source_selector = {
      winbar = true,      -- show the “tabs” at the top of the sidebar
    },
  },
}

