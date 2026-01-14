return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local custom_horizon = require("lualine.themes.horizon")
    local bg = "#161a1f"
    local fg = "#bbbebd"
    
    for _, mode in pairs(custom_horizon) do
      if type(mode) == "table" then
        if mode.a then mode.a = { fg = bg, bg = "#c75575", gui = "bold" } end
        if mode.b then mode.b = { fg = fg, bg = bg } end
        if mode.c then mode.c = { fg = fg, bg = bg } end
        if mode.x then mode.x = { fg = fg, bg = bg } end
        if mode.y then mode.y = { fg = fg, bg = bg } end
        if mode.z then mode.z = { fg = fg, bg = bg } end
      end
    end

    require("lualine").setup({
      options = {
        icons_enabled = false,
        theme = custom_horizon,
        globalstatus = true,
        section_separators = "",
        component_separators = "",
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "diff", "diagnostics" },
        lualine_x = { { "filetype", icon = false }, "location" },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {
        lualine_a = {},
        lualine_b = {
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
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

