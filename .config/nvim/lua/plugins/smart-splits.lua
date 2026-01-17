return {
  "mrjones2014/smart-splits.nvim",
  opts = {
    default_amount = 5,
  },
 keys = {
    { "<C-w><Left>",  function() require("smart-splits").resize_left()  end, desc = "Resize left" },
    { "<C-w><Down>",  function() require("smart-splits").resize_down()  end, desc = "Resize down" },
    { "<C-w><Up>",    function() require("smart-splits").resize_up()    end, desc = "Resize up" },
    { "<C-w><Right>", function() require("smart-splits").resize_right() end, desc = "Resize right" },
  },
}
