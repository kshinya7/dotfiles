local opt = vim.opt

-- opt.relativenumber = true
opt.number = true
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.ignorecase = true
opt.smartcase = true
opt.mousescroll = "ver:1,hor:1"
opt.splitright = true
opt.splitbelow = true
opt.laststatus = 3
opt.swapfile = false
opt.showmode = false
opt.cmdheight = 0
opt.cursorline = true
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.title = true
opt.titlestring = "%<%F"
opt.termguicolors = true
opt.background = "dark"

-- Undercurl support in tmux
vim.cmd [[let &t_Cs = "\e[4:3m"]]
vim.cmd [[let &t_Ce = "\e[4:0m"]]
vim.g.mapleader = " "

-- char customization
opt.fillchars = {
  eob = " ",
  fold = " ",
  -- foldopen = "",
  foldopen = " ",
  foldclose = "",
  foldsep = " ",
}

-- gj/gk for wrapped lines
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- easy escape and save quit
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { silent = true })

vim.keymap.set('n', '<leader>w', ':write<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', '<cmd>bd<cr>')

-- use Ctrl-j and Ctrl-k for command history navigation
vim.keymap.set('c', '<C-j>', '<Down>', { noremap = true })
vim.keymap.set('c', '<C-k>', '<Up>', { noremap = true })

-- window splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical split" })  -- (left/right)
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal split" })  -- (up/down)

-- allow opening files on line number with :e
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*:*",
  callback = function()
    local name = vim.api.nvim_buf_get_name(0)
    local file, line = name:match("^(.+):(%d+)$")
    if file and vim.fn.filereadable(file) == 1 then
      local buf = vim.api.nvim_get_current_buf()
      vim.cmd("edit " .. vim.fn.fnameescape(file))
      local lnum = math.min(tonumber(line), vim.api.nvim_buf_line_count(0))
      vim.api.nvim_win_set_cursor(0, { lnum, 0 })
      vim.api.nvim_buf_delete(buf, { force = true })
      vim.cmd("filetype detect")
    end
  end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
  })

-- Buffer navigation to mimic tabs
vim.keymap.set("n", "gb", ":bnext<CR>")
vim.keymap.set("n", "gB", ":bprevious<CR>")

-- auto center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move lines up/down
vim.keymap.set("n", "<c-j>", ":m .+1<cr>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- copy file relative path
vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%") .. ":" .. vim.fn.line("."))
end, { desc = "Copy relative file path with line number" })

-- diagnostics
vim.diagnostic.config({
  float = { border = "rounded" },
})

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>ci", "<cmd>Inspect<cr>", { desc = "Inspect highlight" })

-- H/L to start/end of line
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
