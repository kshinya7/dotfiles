return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  keys = {
    { 
      "<leader>ff",
      function()
        require('fzf-lua').files({
          fd_opts = "--type f --exclude 'sorbet/rbi/'"
        })
      end,
      desc="Find Files in project directory"
    },
    { 
      "<leader>fg",
      function() require('fzf-lua').live_grep() end,
      desc="Find by grepping in project directory"
    },
    {
      "<leader>fb",
      function()
          require("fzf-lua").buffers()
      end,
      desc = "Find existing buffers",
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").lgrep_curbuf()
      end,
      desc = "Live grep the current buffer"
    },
    {
      "<leader>fa",
      function()
        require("fzf-lua").builtin()
      end,
      desc = "Find builtin commands"
    },
    {
      "<leader>fc",
      function()
        require("fzf-lua").files({
          cwd = vim.fn.expand("~/.config/nvim"),
        })
      end,
      desc = "Find nvim config files"
    },
  },

  config = function()
    require("fzf-lua").setup {
      winopts = {
        height = 0.95,
        width = 0.90,
        -- fullscreen = true,
        preview = {
          layout = "vertical"
        }
      },
    }
  end,
}
