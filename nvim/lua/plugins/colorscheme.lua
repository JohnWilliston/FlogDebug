return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
            styles = {
                functions = {}
            },
            on_colors = function(colors)
                -- I prefer a less bright background color.
                colors.bg = "#0a0b16"
                -- The following is necessary to make the code symbols in the
                -- status line (provided by the trouble plugin configuration)
                -- look right with tokyonight.
                colors.bg_statusline = "#444444"
                -- Change the markdown heading colors a bit.
                --colors.RenderMarkdownH1.bg = "#7fbb07"
            end
        },
        config = function (_, opts)
            local tokyonight = require("tokyonight")
            tokyonight.setup(opts)
            vim.cmd([[colorscheme tokyonight]])
        end
    },

    { "rebelot/kanagawa.nvim", enabled = true, lazy = false, priority = 50, opts = {} },
    { "Mofiqul/vscode.nvim",   enabled = true, lazy = false, priority = 50, opts = {} },
    { "navarasu/onedark.nvim", enabled = true, lazy = false, priority = 50, opts = {} },
}
