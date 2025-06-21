local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
g.have_nerd_font = false

local opt = vim.opt
opt.relativenumber = true
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = true -- fold when overflow text
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus") -- system default clipboard
opt.splitright = true
opt.splitbelow = true
