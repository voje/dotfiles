--[[ init.lua ]]

-- RUST setup
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plugins')      -- Plugins

