return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  keys = {
    { 
      "<leader>ff",
      function()
        require('fzf-lua').files({
          fd_opts = "--type f --exclude 'sorbet/rbi/'"
        })
      end,
      desc="Find files in project directory"
    },
    { 
      "<leader>fg",
      function()
        require('fzf-lua').live_grep({
          rg_opts = table.concat({
            "--column",
            "--line-number",
            "--hidden",
            "--glob '!.git/*'",
            "--glob '!vendor/*'",
            "--glob '!node_modules/*'",
            "--glob '!tmp/*'",
            "--glob '!public/*'",
            "--glob '!sorbet/*'",
          }, " "),
        })
      end,
      desc="Find by grepping in project directory"
    },
    {
      "<leader>fb",
      function()
          require("fzf-lua").buffers()
      end,
      desc = "Find existing buffers",
    },
    {
      "<leader><leader>",
      function()
        require("fzf-lua").lgrep_curbuf()
      end,
      desc = "Live grep the current buffer"
    },
    {
      "<leader>fa",
      function()
        require("fzf-lua").builtin()
      end,
      desc = "Find builtin commands"
    },
    {
      "<leader>fc",
      function()
        require("fzf-lua").commands()
      end,
      desc = "Find commands"
    },
    {
      "<leader>fF",
      function()
        local fzf_lua = require("fzf-lua")

        local dirs = {}
        local fd_cmd = 'fd --type d --hidden --exclude ".git" --exclude "vendor" --exclude "node_modules" --exclude "tmp" --exclude "public" --exclude "sorbet" .'
        for dir in io.popen(fd_cmd):lines() do
          table.insert(dirs, dir)
        end

        if #dirs == 0 then
          print("No directories found")
          return
        end

        fzf_lua.fzf_exec(dirs, {
          prompt = "Pick folder> ",
          actions = {
            ["default"] = function(selected)
              if selected[1] then
                fzf_lua.files({ cwd = selected[1], fd_opts = "--type f" })
              end
            end,
          },
        })
      end,
      desc = "Pick directory then find files",
    },
    {
      "<leader>fG",
      function()
        local fzf_lua = require("fzf-lua")

        local dirs = {}
        local fd_cmd = 'fd --type d --hidden --exclude ".git" --exclude "vendor" --exclude "node_modules" --exclude "tmp" --exclude "public" --exclude "sorbet" .'
        for dir in io.popen(fd_cmd):lines() do
          table.insert(dirs, dir)
        end

        if #dirs == 0 then
          print("No directories found")
          return
        end

        fzf_lua.fzf_exec(dirs, {
          prompt = "Pick folder> ",
          actions = {
            ["default"] = function(selected)
              if selected[1] then
                fzf_lua.live_grep({ cwd = selected[1] })
              end
            end,
          },
        })
      end,
      desc = "Pick directory then live grep",
    },
  },

  opts = {
    winopts = {
      height = 0.8,
      width = 1.0,
      row = 1.0,
      fullscreen = false,
      preview = {
        layout = "vertical",
        vertical = "down:65%",
      },
    },
  },
}
