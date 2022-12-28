return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- General
  use 'tpope/vim-fugitive'
  use 'scrooloose/nerdtree'
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  -- [[ LSP ]]
  -- see languages/<language>.lua
  -- enable specific language in init.lua
  use 'neovim/nvim-lspconfig'

  -- [[ Treesitter ]]
  -- nice config example
  -- https://github.com/tomaskallup/dotfiles/blob/master/nvim/lua/plugins.lua
  use ({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end,
  })

  -- [[ Telescope ]]
  -- $ cargo install ripgrep
  -- $ cargo install fd-find
  -- deps: treesitter
  use {
    'nvim-telescope/telescope.nvim', tag = 'nvim-0.6',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

end)


--[[
  -- Go
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommanded if need floating window support

  -- Rust
  -- System dependencies:
  --   * rust-analyzer
  use 'simrat39/rust-tools.nvim'

  -- Rust auto-completion
  -- Completion framework:
  use 'hrsh7th/nvim-cmp' 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'                             
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'                            
  use 'hrsh7th/vim-vsnip'                             
--]]

--[[
  -- Python development
  use {'neoclide/coc.nvim',
    branch = 'release',
  }
  -- :CocInstall coc-pyright
  -- cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim && yarn install
--]]

-- require('go').setup()
-- require("go.format").gofmt()  -- gofmt only
-- require("go.format").goimport()  -- goimport + gofmt

