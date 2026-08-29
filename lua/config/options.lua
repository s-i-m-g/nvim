local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false -- 42 norm wants real tabs
opt.smartindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.updatetime = 250
opt.undofile = true
opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true

opt.cursorline = true
opt.cursorlineopt = "number" -- highlight the line number only, not the whole line

vim.g.mapleader = " "
vim.g.maplocalleader = " "
