return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    opts = function()
        return {
            ensure_installed = { "lua", "rust", "python", "markdown"},
            sync_install = false,
            auto_install = true,
            -- ignore_install = { "javascript" },
            highlight = {
                enable = { "lua", "rust", "python", "markdown"},
                additional_vim_regex_highlighting = false,
            },
        }
    end,
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)
    end,
}

