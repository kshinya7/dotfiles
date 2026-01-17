local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.timeoutlen = 400
opt.updatetime = 200
opt.wrap = true
opt.linebreak = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
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

-- easy escape and save quit
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { silent = true })

vim.keymap.set('n', '<leader>w', ':write<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':quit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Q', '<cmd>q!<cr>', { noremap = true, silent = true })

-- use Ctrl-j and Ctrl-k for command history navigation
vim.keymap.set('c', '<C-j>', '<Down>', { noremap = true })
vim.keymap.set('c', '<C-k>', '<Up>', { noremap = true })

vim.keymap.set("n", "<C-w>+", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-w>-", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-w>>", ":vertical resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-w><", ":vertical resize -2<CR>", { silent = true })

-- window splits
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical split" })  -- (left/right)
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal split" })  -- (up/down)

-- mappings for "[" and "]" in Normal / visual / operator-pending
vim.keymap.set({ "n", "v", "o" }, "´", "[", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "+", "]", { noremap = true })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
  })

-- copy file relative path
vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative file path" })

