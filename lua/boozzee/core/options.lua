local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = false
opt.smartindent = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.background = "dark"
opt.pumheight = 12
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = false
opt.laststatus = 3

opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 200
opt.timeoutlen = 300
opt.completeopt = { "menuone", "noselect" }

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
