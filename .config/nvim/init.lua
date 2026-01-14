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
  pattern = "horizon",
  callback = function()
    -- Set background color
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1d2026" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1d2026" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1d2026" })

    -- Window separator line
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#161a1f" })

    -- Winsep separator
    vim.api.nvim_set_hl(0, "ColorfulWinSep", { fg = "#6a6a6a" })

    -- Cursor line
    vim.api.nvim_set_hl(0, "CursorLine", { bg = none })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b1b1b1", bold = false })

    -- Ufo folds
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = none })

    -- Color customizations
    local light_blue = "#39a7b1"
    local white = "#d4d4d4"
    local purple = "#a16ac1"
    local red = "#c75575"
    local orange = "#d18c80"
    local light_yellow = "#deb697"

    vim.api.nvim_set_hl(0, "Boolean", { fg = orange })
    vim.api.nvim_set_hl(0, "String", { fg = light_yellow })
    vim.api.nvim_set_hl(0, "Type", { fg = light_yellow })
    vim.api.nvim_set_hl(0, "Number", { fg = orange })
    vim.api.nvim_set_hl(0, "Function", { fg = light_blue })
    vim.api.nvim_set_hl(0, "@variable", { fg = white })
    vim.api.nvim_set_hl(0, "@string.special", { fg = white })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#595f68" })
    vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = purple })
    vim.api.nvim_set_hl(0, "@punctuation.special", { fg = purple })
    vim.api.nvim_set_hl(0, "@operator", { fg = purple })
    vim.api.nvim_set_hl(0, "Operator", { fg = purple })
    vim.api.nvim_set_hl(0, "Statement", { fg = purple })
    vim.api.nvim_set_hl(0, "@variable.parameter", { fg = red })
    vim.api.nvim_set_hl(0, "Special", { fg = orange })
    vim.api.nvim_set_hl(0, "PreProc", { fg = orange })
    vim.api.nvim_set_hl(0, "Constant", { fg = red })
    vim.api.nvim_set_hl(0, "@variable.member", { fg = red })
    vim.api.nvim_set_hl(0, "@property", { fg = red })
    vim.api.nvim_set_hl(0, "Identifier", { fg = red })
    vim.api.nvim_set_hl(0, "@keyword.function", { fg = purple })
    vim.api.nvim_set_hl(0, "@keyword", { fg = purple })
    vim.api.nvim_set_hl(0, "@function.builtin", { fg = light_yellow })
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = light_yellow })
    vim.api.nvim_set_hl(0, "@label", { fg = white })

    -- Start ruby highlights
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ruby",
      callback = function()
        vim.treesitter.start()
      end
    })
  end
})

require("config.options")
require("config.filetypes")
require("config.lazy")

