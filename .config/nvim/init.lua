-- Teide-specific color customizations
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "horizon",
  callback = function()
    -- Set background color
    local bg_color = "#1c1e26"
    local accent_color = "#191a21"

    vim.api.nvim_set_hl(0, "Normal", { bg = bg_color })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = bg_color })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = bg_color })

    -- Window separator line
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = accent_color })

    -- Winsep separator
    vim.api.nvim_set_hl(0, "ColorfulWinSep", { fg = "#6a6a6a" })

    -- Cursor line
    vim.api.nvim_set_hl(0, "CursorLine", { bg = none })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b1b1b1", bold = false })

    -- Ufo folds
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = none })

    -- Spells
    vim.api.nvim_set_hl(0, "@spell", { fg = "#4c4d52", italic = true })

    -- Diagnostics
    local blue = "#4491cf"
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = blue })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = blue })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = blue })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = blue })


    -- Color customizations
    local light_blue = "#39a7b1"
    local white = "#d4d4d4"
    local purple = "#a76dc8"
    local red = "#ce5773"
    local orange = "#d18c80"
    local light_yellow = "#deb697"

    vim.api.nvim_set_hl(0, "Boolean", { fg = orange })
    vim.api.nvim_set_hl(0, "String", { fg = light_yellow })
    vim.api.nvim_set_hl(0, "Type", { fg = light_yellow })
    vim.api.nvim_set_hl(0, "Number", { fg = orange })
    vim.api.nvim_set_hl(0, "Float", { fg = orange })
    vim.api.nvim_set_hl(0, "Function", { fg = light_blue })
    vim.api.nvim_set_hl(0, "@variable", { fg = white })
    vim.api.nvim_set_hl(0, "@string.special", { fg = white })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#4c4d52" })
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

    -- NeoTree
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = accent_color })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = accent_color })
    vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#2a2f36" })
    vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = "#6e7681" })

    -- Git status colors
    local git_green = "#73c991"
    local git_yellow = "#deb697"
    local git_red = "#f14c4c"
    local git_grey = "#6e7681"
    vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = git_green })
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = git_yellow })
    vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = git_red })
    vim.api.nvim_set_hl(0, "NeoTreeGitRenamed", { fg = git_green })
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = git_green })
    vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = git_grey })
    vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = git_yellow })
    vim.api.nvim_set_hl(0, "NeoTreeGitStaged", { fg = git_green })
    vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = git_red })
  end
})

require("config.options")
require("config.filetypes")
require("config.lazy")

