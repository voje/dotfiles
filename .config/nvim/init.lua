-- init.lua
require("options")
require("keybinds")

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

--
-- Configure plugins
-- 
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

