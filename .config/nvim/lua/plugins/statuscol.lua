return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,
      segments = {
        { sign = { namespace = { "gitsigns" } }, click = "v:lua.ScSa" },  -- git signs
        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },  -- line numbers
        { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },  -- folds
      },
    })
  end,
}
