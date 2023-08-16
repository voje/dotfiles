-- init.lua


-- Options
vim.g.mapleader = " "

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = false

vim.opt.number = true
vim.opt.signcolumn = "yes"

-- Keybinds
vim.keymap.set("n", "<leader>nt", vim.cmd.NERDTreeFocus)

-- LSP
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)

vim.keymap.set("n", "<leader>so", function()
    vim.cmd.source("init.lua")
end)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- Configure plugins
require("catppuccin").setup { transparent_background = true }
vim.cmd.colorscheme "catppuccin"

require("lualine").setup()
require("config.treesitter")
require("rainbow-delimiters.setup")


require("mason").setup()
require("mason-lspconfig").setup()

-- :h mason-lspconfig-server-map
require("lspconfig").pyright.setup {}
-- pip3 install --user --upgrade ansible-lint
require("lspconfig").ansiblels.setup {}

