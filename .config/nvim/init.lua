local function make_transparent()
  local groups = {
    "Normal",
    "NormalNC",
    "SignColumn",
    "EndOfBuffer",
    "MsgArea",
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
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = make_transparent,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    vim.schedule(function()
      -- vim.cmd.colorscheme("xcodelighthc")
      vim.cmd.colorscheme("horizon")
    end)
  end,
})

require("config.options")
require("config.filetypes")
require("config.lazy")

