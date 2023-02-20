-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})

-- LSP
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

