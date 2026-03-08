return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    focus = true,
    preview = {
      wo = {
        wrap = true,
      },
    },
    win = {
      position = "right",
      size = 74,
      wo = {
        winhighlight = "Normal:TroubleNormal",
      },
    },
    modes = {
      qflist = {
        groups = {
          { "filename", format = "{file_icon} {file_basename}  {file_dirname}" },
        },
        format = "{lnum} {text}",
      },
      fzf_files = {
        groups = {},
        format = "{file_icon} {file_basename}  {file_dirname}",
      },
      fzf = {
        groups = {
          { "filename", format = "{file_icon} {file_basename}  {file_dirname}" },
        },
        format = "{lnum} {match_before}{match_text}{match_after}",
      },
    },
  },
  config = function(_, opts)
    local split_cache = {}

    local function get_line_split(item)
      if not item then return "", "", "" end
      local lnum = (item.pos or {})[1] or 0
      local col = (item.pos or {})[2] or 1
      local filename = item.filename or ""
      if filename == "" or lnum == 0 then return "", "", "" end

      local key = filename .. ":" .. lnum
      if split_cache[key] then return unpack(split_cache[key]) end

      local ok, lines = pcall(vim.fn.readfile, filename, "", lnum)
      if not ok or not lines or #lines < lnum then
        split_cache[key] = { "", "", "" }
        return "", "", ""
      end

      local line = lines[lnum]
      local leading = line:match("^%s+")
      local trim_len = leading and #leading or 0
      local trimmed = line:sub(trim_len + 1)
      local adj_col = math.max(1, col - trim_len + 1)

      if adj_col > #trimmed then
        split_cache[key] = { trimmed, "", "" }
        return trimmed, "", ""
      end

      local query = vim.g.fzf_last_query or ""
      local before = trimmed:sub(1, adj_col - 1)
      local match = trimmed:sub(adj_col, adj_col + #query - 1)
      local after = trimmed:sub(adj_col + #query)

      split_cache[key] = { before, match, after }
      return before, match, after
    end

    opts.formatters = vim.tbl_extend("force", opts.formatters or {}, {
      file_basename = function(ctx)
        local filename = ctx.item and ctx.item.filename or ""
        return { text = vim.fn.fnamemodify(filename, ":t") }
      end,
      file_dirname = function(ctx)
        local filename = ctx.item and ctx.item.filename or ""
        local dir = vim.fn.fnamemodify(filename, ":~:.:h")
        return { text = dir == "." and "" or dir }
      end,
      lnum = function(ctx)
        local pos = ctx.item and ctx.item.pos or {}
        return { text = tostring(pos[1] or "") .. ":" }
      end,
      match_before = function(ctx)
        local before, _, _ = get_line_split(ctx.item)
        return { text = before, hl = "TroubleFzfFullLine" }
      end,
      match_text = function(ctx)
        local _, match, _ = get_line_split(ctx.item)
        return { text = match, hl = "TroubleFzfMatch" }
      end,
      match_after = function(ctx)
        local _, _, after = get_line_split(ctx.item)
        return { text = after, hl = "TroubleFzfFullLine" }
      end,
    })

    require("trouble").setup(opts)
  end,
  keys = {
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Trouble: quickfix" },
  },
}
