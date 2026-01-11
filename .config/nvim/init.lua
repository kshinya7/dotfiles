local function make_transparent()
  local groups = {
    "EndOfBuffer",
    "NormalFloat",
    "FloatBorder",
    "Pmenu",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
  }
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end
end

-- Transparency for all colorschemes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = make_transparent,
})

-- Teide-specific color customizations
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "teide",
  callback = function()
    -- Set background color
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1d2026" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1d2026" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1d2026" })

    -- Window separator line
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#161a1f" })

    -- Winsep separator
    vim.api.nvim_set_hl(0, "ColorfulWinSep", { fg = "#9e6441" })

    -- Cursor line
    vim.api.nvim_set_hl(0, "CursorLine", { bg = none })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff8b39", bold = false })

    -- Ufo folds
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = none })

    -- Color customizations
    local light_green = "#7fe1b0"
    local light_blue = "#63c0ea"
    local white = "#d0d3d2"
    vim.api.nvim_set_hl(0, "Boolean", { fg = light_green })
    vim.api.nvim_set_hl(0, "String", { fg = light_green })
    vim.api.nvim_set_hl(0, "Number", { fg = light_green })
    vim.api.nvim_set_hl(0, "Function", { fg = light_blue })
    vim.api.nvim_set_hl(0, "@variable", { fg = white })
  end
})

require("config.options")
require("config.filetypes")
require("config.lazy")

