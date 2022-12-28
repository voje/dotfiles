--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('', '<leader>w', '<cmd>write<cr>', {})

