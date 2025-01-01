return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = {
            "asm",
            "awk",
            "bash",
            "c",
            "c_sharp",
            "cpp",
            "css",
            "csv",
            "diff",
            "disassembly",
            "dockerfile",
            "doxygen",
            "gdscript",
            "go",
            "html",
            "http",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "query",
            "rust",
            "sql",
            "terraform",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
            "zig",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            disable = {}, -- List of languages that will be disabled.
            use_languagetree = true,
        },
        indent = { enable = true },
    }
}
