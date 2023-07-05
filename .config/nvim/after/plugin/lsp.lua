local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = true,
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ansiblels
lsp.ensure_installed({
    'bashls',
    'lua_ls',
    'pyright',
    'gopls',
})
    -- 'yamlls',
    -- 'ansiblels',
    -- 'helm_ls',
	-- 'rust_analyzer',

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

