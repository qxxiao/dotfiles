
local map = require("utils").map

-----------------------------
-- global keymapings
-----------------------------

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- set leader key
map("", "<Space>", "<Nop>", {silent=true})
map("n", "9", "$", {silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map ("i", ",,", "<Esc>", {silent = true})
map("n", ",,", "<Esc>", {silent = true}) -- for telescope etc.
map("c", ",,", "<Esc>", {silent = true})
map("v", ",,", "<Esc>", {silent = true})
map("x", ",,", "<Esc>", {silent = true})
map("t", ",,", "<C-\\><C-n>", {silent = true}) -- return normal mode

vim.cmd([[
    function g:CloseBufOrWin() abort
        let l:bufs = getbufinfo({"buflisted":1})
        let l:curbuf = getbufinfo(bufname(""))[0]
        
        if curbuf.listed == 0
            execute "bdelete"
            return 
        endif

        if len(curbuf.windows) > 1
            execute 'close'
        elseif len(bufs) == 1
            execute 'bdelete'
        elseif bufnr("") == bufs[-1].bufnr
            execute ('bprevious | bdelete' . curbuf.bufnr)
        else
            execute ('bnext | bdelete' . curbuf.bufnr)
        endif
    endfunction
]])

-- getbufinfo({"buflisted":1}) 列举list的buffers信息 -普通文件
-- getbufinfo({"bufloaded":1}) 所有已经载入的buffers信息
-- len(getbufinfo("")) 第一个是当前buffer信息？
-- 0 
-- 1. 当前buffer有多个window时，关闭当前窗口，不关闭buffer
-- 2，修改:如果还有其他listed buffer直接显示，只是关闭当前buffer:
--  关闭所有显示的listed buffer会有一个unamed buffer
vim.cmd([[
    nnoremap q <cmd>call CloseBufOrWin()<CR>
]])
-- map("n", "q", ":q<CR>", {silent = true})

-- auto format
-- note: Format is provides nvim lsp see lsp handler.lua
vim.cmd([[autocmd FileType c,cpp,java inoremap <silent><buffer> ;  ;<Esc>:Format<CR>a]])
-- ctrl+s
map ("n", "<C-s>", [[:w!<CR>]])
map("i", "<C-s>", [[<Esc>:w!<CR>a]])
map("c", "<C-s>", [[<Esc>:w!<CR>a]])
map("v", "<C-s>", [[<Esc>:w!<CR>a]])


-- Normal --
-- window navigation for C-w + hjkl
map("n", "<C-h>", "<C-w>h", {silent = true})
map("n", "<C-j>", "<C-w>j", {silent = true})
map("n", "<C-k>", "<C-w>k", {silent = true})
map("n", "<C-l>", "<C-w>l", {silent = true})

-- Resize with arrows
map("n", "<C-Up>", ":resize +3<CR>", {silent = true})
map("n", "<C-Down>", ":resize -3<CR>", {silent = true})
map("n", "<C-Left>", ":vertical resize -3<CR>", {silent = true})
map("n", "<C-Right>", ":vertical resize +3<CR>",  {silent = true})

-- Navigate buffers
-- shift + l | shift + h
map("n", "<S-l>", ":bnext<CR>", {silent = true})
map("n", "<S-h>", ":bprevious<CR>", {silent = true})

-- Move text up and down
-- A == M alt/option
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", {silent = true})
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", {silent = true})
