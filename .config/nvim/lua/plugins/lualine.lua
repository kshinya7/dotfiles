return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = false,
        theme = "amaranth",
        globalstatus = true,
        section_separators = "",
        component_separators = "",
      },

      sections = {
        lualine_a = { { "mode", fmt = function(s) return s:sub(1, 1) end } },
        lualine_b = { "branch" },
        lualine_c = { "diff", "diagnostics" },
        lualine_x = { { "filetype", icon = false }, "location" },
        lualine_y = {},
        lualine_z = {},
      },

      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 0, -- filename only
            symbols = {
              modified = " [+]",
              readonly = " [-]",
              unnamed  = "[No Name]",
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 0,
            symbols = {
              modified = " [+]",
              readonly = " [-]",
              unnamed  = "[No Name]",
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

