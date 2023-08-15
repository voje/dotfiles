-- init.lua
vim.g.mapleader = " "

-- Disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

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

-- Lazy plugins
require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ 
		"nvim-telescope/telescope.nvim", tag = "0.1.2",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"BurntSushi/ripgrep",
		},
	},
})

-- Colorscheme
require("catppuccin").setup({
	transparent_background = true
})
vim.cmd.colorscheme "catppuccin"

