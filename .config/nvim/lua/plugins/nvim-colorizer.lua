return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup(
      { "css", "scss", "html", "javascript" },  -- filetypes
      {
        RGB      = true,       -- #RGB hex codes
        RRGGBB   = true,       -- #RRGGBB hex codes
        RRGGBBAA = true,       -- enable #RRGGBBAA hex codes
        names    = true,       -- named colors
        rgb_fn   = true,      -- rgb()/rgba() functions
        hsl_fn   = true,      -- hsl()/hsla() functions
        css      = false,
        css_fn   = false,
        mode     = 'background'
      }
    )
  end
}
