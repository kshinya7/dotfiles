local _git_root_cache = {}
local _patterns_cache = {}
local _owner_cache = {}

local function get_git_root(dir)
  if _git_root_cache[dir] ~= nil then return _git_root_cache[dir] end
  local result = vim.fn.systemlist("git -C " .. vim.fn.shellescape(dir) .. " rev-parse --show-toplevel")[1]
  local root = (vim.v.shell_error == 0 and result) or false
  _git_root_cache[dir] = root
  return root
end

local function parse_codeowners(path)
  local mtime = vim.fn.getftime(path)
  local cached = _patterns_cache[path]
  if cached and cached.mtime == mtime then return cached.patterns end

  local patterns = {}
  for _, line in ipairs(vim.fn.readfile(path)) do
    if not line:match("^%s*#") and line:match("%S") then
      local glob, owner = line:match("^(%S+)%s+(%S+)")
      if glob and owner then
        local lua_pat = glob
          :gsub("%.", "%%.")
          :gsub("%*%*/?", ".*")
          :gsub("%*", "[^/]*")
          :gsub("%?", "[^/]")
        if glob:sub(1, 1) ~= "/" then
          lua_pat = ".*" .. lua_pat
        else
          lua_pat = lua_pat:sub(2)
        end
        patterns[#patterns + 1] = { pat = lua_pat, owner = owner }
      end
    end
  end

  _patterns_cache[path] = { mtime = mtime, patterns = patterns }
  return patterns
end

local function codeowner()
  local bufpath = vim.api.nvim_buf_get_name(0)
  if bufpath == "" then return "" end

  if _owner_cache[bufpath] ~= nil then return _owner_cache[bufpath] end

  local dir = vim.fn.fnamemodify(bufpath, ":h")
  local git_root = get_git_root(dir)
  if not git_root then
    _owner_cache[bufpath] = ""
    return ""
  end

  local codeowners_path
  for _, loc in ipairs({ "docs/CODEOWNERS", ".github/CODEOWNERS", "CODEOWNERS" }) do
    local candidate = git_root .. "/" .. loc
    if vim.fn.filereadable(candidate) == 1 then
      codeowners_path = candidate
      break
    end
  end
  if not codeowners_path then
    _owner_cache[bufpath] = ""
    return ""
  end

  local rel_path = bufpath:sub(#git_root + 2)
  local matched_owner = ""
  for _, entry in ipairs(parse_codeowners(codeowners_path)) do
    if rel_path:match("^" .. entry.pat .. "$") or rel_path:match("^" .. entry.pat) then
      matched_owner = entry.owner
    end
  end

  -- Invalidate owner cache when CODEOWNERS changes (checked on next BufEnter)
  _owner_cache[bufpath] = matched_owner
  return matched_owner
end

-- Clear owner cache when switching buffers so CODEOWNERS edits are picked up
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local path = vim.api.nvim_buf_get_name(0)
    _owner_cache[path] = nil
  end,
})

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = false,
        theme = "auto",
        globalstatus = true,
        component_separators = "",
      },

      sections = {
        lualine_a = { { "mode", fmt = function(s) return s:sub(1, 1) end } },
        lualine_b = { "branch" },
        lualine_c = { "diff", "diagnostics" },
        lualine_x = { codeowner, { "filetype", icon = false }, "location" },
        lualine_y = {},
        lualine_z = {},
      },

    })
  end,
}

