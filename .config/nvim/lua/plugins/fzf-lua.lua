return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  keys = (function()
    local fzf_actions = {
      ["default"] = function(selected, opts)
        if #selected > 1 then
          vim.g.fzf_last_query = opts.last_query or ""
          require("trouble.sources.fzf").open(selected, opts)
        else
          require("fzf-lua.actions").file_edit(selected, opts)
        end
      end,
    }
    return {
    {
      "<leader>ff",
      function()
        require('fzf-lua').files({
          fd_opts = "--type f --exclude 'sorbet/rbi/'",
          actions = fzf_actions,
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
          actions = fzf_actions,
        })
      end,
      desc="Find by grepping in project directory"
    },
    {
      "<leader>fb",
      function()
        require("fzf-lua").buffers({ actions = fzf_actions })
      end,
      desc = "Find existing buffers",
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").lgrep_curbuf({ actions = fzf_actions })
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
                fzf_lua.files({ cwd = selected[1], fd_opts = "--type f", actions = fzf_actions })
              end
            end,
          },
        })
      end,
      desc = "Pick directory then find files",
    },
    {
      "<leader>fr",
      function()
        require("fzf-lua").resume()
      end,
      desc = "Resume last fzf-lua picker",
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
                fzf_lua.live_grep({ cwd = selected[1], actions = fzf_actions })
              end
            end,
          },
        })
      end,
      desc = "Pick directory then live grep",
    },
  } end)(),

  opts = {
    defaults = {
      formatter = "path.filename_first",
    },
    keymap = {
      fzf = {
        ["ctrl-a"] = "select-all",
      },
    },
    hls = {
      border = "FzfLuaBorder",
    },
    winopts = {
      height = 0.9,
      width = 1.0,
      row = 1.0,
      fullscreen = false,
      border = { "─", "─", "─", " ", " ", " ", " ", " " },
      preview = {
        layout = "vertical",
        vertical = "down:65%",
        border = { "─", "─", "─", " ", " ", " ", " ", " " },
        title = false,
      },
    },
    builtin = {
      winopts = {
        height = 0.9,
        width = 1.0,
        row = 1.0,
      },
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    require("fzf-lua").register_ui_select()
  end,
}
