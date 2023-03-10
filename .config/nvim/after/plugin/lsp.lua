local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ansiblels
lsp.ensure_installed({
	'rust_analyzer',
	'gopls',
    'pyright',
    'yamlls',
    'ansiblels',
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- https://github.com/redhat-developer/yaml-language-server
require('lspconfig')['yamlls'].setup {
    settings = {
        yaml = {
            format = {
                enable = true,
            },
            validate = true,
            hover = true,
            completion = true,
            keyOrdering = false,
            editor = {
                tabSize = 2,
            },
        },
    }
}

-- https://als.readthedocs.io/settings/
require('lspconfig')['ansiblels'].setup {
    settings = {
        ansible = {
            validation = {
                -- Without ansible-lint, uses 
                -- --syntax-check
                enabled = true,
                lint = {
                    -- Toggle usage of ansible-lint default value: true
                    -- ansible-lint bugged with python 3.8
                    enabled = false,
                }
            }
        },
    },
}
