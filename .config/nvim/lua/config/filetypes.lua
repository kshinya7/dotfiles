vim.filetype.add({
  pattern = {
    [".*%.html%.erb"] = "eruby",
    [".*%.json%.jbuilder"] = "ruby",
    [".*/app/views/.*%.erb"] = "eruby",
  },
})

