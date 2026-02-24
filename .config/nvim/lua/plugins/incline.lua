return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  config = function()
    require("incline").setup({
      window = {
        padding = 1,
        margin = { horizontal = 1, vertical = 0 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then filename = "[No Name]" end
        local modified = vim.bo[props.buf].modified
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return {
          { icon, guifg = color },
          { " " },
          { filename },
          modified and " [+]" or "",
        }
      end,
    })
  end,
}
