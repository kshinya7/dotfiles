return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- unify status box color
    local horizon = require("lualine.themes.horizon")

    local unified = {
      fg = horizon.normal.a.fg,
      bg = horizon.normal.a.bg,
      gui = "bold",
    }

    for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command" }) do
      if horizon[mode] and horizon[mode].a then
        horizon[mode].a = unified
      end
    end

    require("lualine").setup({
      options = {
        theme = horizon,
        globalstatus = true,
        section_separators = "",
        component_separators = "",
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },

      tabline = {
        lualine_a = {
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
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

