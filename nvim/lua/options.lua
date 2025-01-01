-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- Makes Neovim use the tab stop setting for shift width.
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.inccommand = "split"
vim.opt.termguicolors = true

-- I go back and forth on this. The plus is that it lets you search for things
-- in  case insensitive way as well as type commands in lower case and use the
-- tab key to complete them. The minus, of course, is that it will not let you
-- do case sensitive comparison without changing the setting.
vim.opt.ignorecase = true

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Enable default clipping to the system clipboard.
--vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.clipboard:append { "unnamed", "unnamedplus" }

-- Enable virtual editing to let the cursor go where no text exists when in block mode.
vim.opt.virtualedit = "block"

-- Disable Ruby and Perl remote plugin support to avoid health check errors.
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- --vim.lsp.set_log_level("debug")

-- Finally, enable the exrc feature for project-folder-specific settings.
vim.o.exrc = true

-- I added this auto command to override file detection because Neovim was 
-- sometimes detecting a *.cpp file as filetype 'conf', which I believe is
-- a sort of default "configuration file" type. I want all my *.cpp files to
-- be detected as type 'cpp'.
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.cpp", "*.h"},
    command = "set filetype=cpp",
})

