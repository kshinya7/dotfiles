require("rose-pine").setup({
  options = {
    transparent = true,
    styles = {
      floats = "transparent", -- style for floating windows
    }
  }
})

vim.cmd [[colorscheme rose-pine]]
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
