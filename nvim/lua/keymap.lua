
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
map("c", ",,", "<Esc>", {silent = true})
map("v", ",,", "<Esc>", {silent = true})
map("t", ",,", "<C-\\><C-n>", {silent = true})

-- quit window 
-- 定义为退出该buffer, 回到上一个buffer
-- bdelete bprevious bnext
-- map("n", "q", ":bd<CR>:bp<CR>")
-- 解决多个window共用一个buffer破坏多个windown的问题
-- 只是关闭当前窗口, 不会关闭buffer(其他窗口打开)；否则关闭buffer切换到下一个buffer/前一个
vim.cmd([[
    nnoremap <expr>q len(getbufinfo("")[0].windows) > 1 ?
    \ ":close<CR>" :
    \ (bufnr("") == getbufinfo({"buflisted": 1})[-1].bufnr ? ":bp" : ":bn")."<bar>bd #<CR>"
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
