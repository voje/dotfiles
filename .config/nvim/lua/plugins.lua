return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'scrooloose/nerdtree'
  use 'tpope/vim-fugitive'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Go
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommanded if need floating window support

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
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

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

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- require('go').setup()
-- require("go.format").gofmt()  -- gofmt only
-- require("go.format").goimport()  -- goimport + gofmt

end)

