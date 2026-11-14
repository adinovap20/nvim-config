vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

-- Line numbers & UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.scrolloff = 8

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Splits & Clipboard
opt.splitright = true
opt.splitbelow = true
opt.clipboard = 'unnamedplus'
opt.undofile = true
