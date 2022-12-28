--[[ init.lua ]]

-- RUST setup
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('opts')      -- Options (spaces, ...)
require('keys')      -- Keymaps
require('vars')      -- Variables
require('plugins')      -- Plugins

-- Various languages
require('languages.go')
require('plugins.treesitter')

