return {
    { "preservim/nerdtree" },
    { "nvim-treesitter/playground" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    { 
        "nvim-telescope/telescope.nvim", tag = "0.1.2",
        dependencies = { 
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "BurntSushi/ripgrep",
        },
    },
    { url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git" },
    { "Olical/conjure" },
}
