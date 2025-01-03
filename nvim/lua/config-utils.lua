-- I was having trouble with neo-tree closing nvim entirely whenever I used a
-- simple `:bd` command. I found I could "fix" that by changing one of its
-- settings ('close_if_last_window') to false, but then it was an annoying
-- plugin that would hang around after the last buffer was closed. Hmph. The
-- following utility function was obtained from a discussion thread:
--
--   https://github.com/nvim-neo-tree/neo-tree.nvim/issues/1504
--
-- It's my first real custom Lua module for Neovim configuration, so I was glad
-- I could figure out how to get it working.

local M = {}

--- This function is taken directly from [LazyVim's UI utils](https://github.com/LazyVim/LazyVim/blob/a1c3ec4cd43fe61e3b614237a46ac92771191c81/lua/lazyvim/util/ui.lua#L228).
--- Besides some other nice features, this primarily prevents neo-tree from
--- taking up the whole screen after deleting a buffer.
--- (Thank you folke)
---@param buf number?
function M.bufremove(buf)
    buf = buf or 0
    buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

    if vim.bo.modified then
        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
        if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
            return
        end
        if choice == 1 then -- Yes
            vim.cmd.write()
        end
    end

    for _, win in ipairs(vim.fn.win_findbuf(buf)) do
        vim.api.nvim_win_call(win, function()
            if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
                return
            end
            -- Try using alternate buffer
            local alt = vim.fn.bufnr("#")
            if alt ~= buf and vim.fn.buflisted(alt) == 1 then
                vim.api.nvim_win_set_buf(win, alt)
                return
            end

            -- Try using previous buffer
            local has_previous = pcall(vim.cmd, "bprevious")
            if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
                return
            end

            -- Create new listed buffer
            local new_buf = vim.api.nvim_create_buf(true, false)
            vim.api.nvim_win_set_buf(win, new_buf)
        end)
    end
    if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.cmd, "bdelete! " .. buf)
    end
end

-- This function closes all open trouble views. I found the code in the GitHub
-- issue: https://github.com/folke/trouble.nvim/issues/456
function M.troubleclose()
    local trouble = require("trouble")
    local Preview = require("trouble.view.preview")
    if Preview.is_open() then
      Preview.close()
    end
    local view = trouble.close()
    while view do
        view = trouble.close()
    end
end

return M
