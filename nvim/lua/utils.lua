local M = {}

-- Functional wrapper for mapping custom keybindings
-- opts: <silent> / <noremap>，请参阅:h map-arguments
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true } -- 非递归
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.bufMap(bufnr, mode, lhs, rhs, opts)
    M.map("n", lhs, rhs, opts)
    local options = { noremap = true } -- 非递归
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
end

return M