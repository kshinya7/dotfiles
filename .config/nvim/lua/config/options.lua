local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.wrap = true
opt.linebreak = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.fillchars = { eob = " " }
opt.clipboard:append("unnamedplus")
vim.opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.laststatus = 3
vim.opt.swapfile = false
vim.opt.showmode = false
vim.opt.cmdheight = 0

opt.termguicolors = true
opt.background = "dark"

vim.g.mapleader = " "

-- easy escape and save quit
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('v', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { silent = true })

vim.keymap.set('n', '<leader>w', ':write<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':quit<CR>', { noremap = true, silent = true })

-- window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- highlight yanked text
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]], false)

-- copy file relative path
vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative file path" })

