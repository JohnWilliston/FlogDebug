-- This file is for the plugins that don't require much configuration, that
-- being an admittedly vague notion yet hopefully tolerably clear.

return {
    "sindrets/diffview.nvim",
    "rafamadriz/friendly-snippets",
    "bennypowers/splitjoin.nvim",
    {
        "rhysd/vim-syntax-christmas-tree",
        cmd = "MerryChristmas",
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        'kosayoda/nvim-lightbulb',
        opts = {
            autocmd = { enabled = true }
        }
    },
    {
        "NStefan002/screenkey.nvim",
        cmd = "Screenkey",
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = true,
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",      -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons",  -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        config = true,
    },
    {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",
        },
    },
    {
        "bullets-vim/bullets.vim",
    },
    {
        "gennaro-tedesco/nvim-peekup",
    },
}

