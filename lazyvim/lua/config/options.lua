-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--

local opt = vim.opt

opt.mouse = ""
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.cursorline = false

vim.g.lazyvim_prettier_needs_config = false
vim.g.snacks_animate = false
-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = true
