return {
    "rmagatti/auto-session",
    lazy = false,
    enabled = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { '~/', '~/Dropbox', '~/Downloads', '/' },
        -- log_level = 'debug',
    }
}
