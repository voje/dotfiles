-- [[ Helm ]]

require('lazy').setup({
  'towolf/vim-helm',
})

-- [[ Helm ]]
require('lspconfig').helm_ls.setup({
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
})
