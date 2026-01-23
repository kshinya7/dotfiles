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
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.signcolumn = "no"
          vim.opt_local.foldcolumn = "0"
        end,
      },
    },
    close_if_last_window = true,
    use_libuv_file_watcher = true,
    group_empty_dirs = true,
    window = {
      padding = 0,
    },
    default_component_configs = {
      indent = {
        -- indent_size = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "│",
        highlight = "NeoTreeIndentMarker",
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = {
        symbols = {
          added = "A",
          modified = "M",
          deleted = "D",
          renamed = "R",
          untracked = "U",
          ignored = "",
          unstaged = "",
          staged = "A",
          conflict = "C",
        },
      },
    },
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
          { "git_status", padding = { left = 1 } },
        },
        file = {
          { "indent" },
          { "icon" },
          { "name" },
          { "git_status", padding = { left = 1 } },
        },
        symlink = {
          { "indent" },
          { "icon" },
          { "name" },
          { "git_status", padding = { left = 1 } },
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
  },
}

