-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Rust
  -- System dependencies:
  --   * rust-analyzer
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'simrat39/rust-tools.nvim'

  --[[ Rust auto-completion ]]
  -- Completion framework:
  use 'hrsh7th/nvim-cmp' 

  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'                             
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'                            
  use 'hrsh7th/vim-vsnip'                             

  -- [[ Python development ]]
  use {'neoclide/coc.nvim',
    branch = 'release',
  }
  -- :CocInstall coc-pyright
  -- cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim && yarn install


  -- [[ General-purpose ]]
  -- https://jdhao.github.io/2018/09/28/nvim_tagbar_install_use/
  -- dep: build and ins https://github.com/universal-ctags/ctags.git
  use "majutsushi/tagbar"

  -- [[ Utils ]]
  use "scrooloose/nerdtree"

  --[[ 
  -- Let's try not using mason (trouble pulling packages when at work - 
  -- firewall??)
  -- Rust (mason)
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"

  -- Setup mason
  require("mason").setup {
      providers = {
          "mason.providers.client",
          "mason.providers.registry-api",
      }
  }
  ]]--


-- Set up rust-tools
-- This plugin automatically configures nvim-lspconfig
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})


end)

