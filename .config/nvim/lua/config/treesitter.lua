require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "yaml" },
  sync_install = false,
  auto_install = false,
  -- ignore_install = { "javascript" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  playground = { enable = false },
}
