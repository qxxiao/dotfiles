local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]], -- mapping to the command :ToggleTerm.
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal", -- 默认toggle的方向 horizontal, vertical, float
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

-- 在terminal模式下跳转窗口
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', ',,', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
-- 注意这些设置hidden的term不能被ctrl+\隐藏/唤出
-- 只能使用lazygit,...python,new创建返回的值来管理--即通过命令
-- 不想退出销毁使用:close，如果使用q退出销毁
local python = Terminal:new({ cmd = "python3", hidden = true, id=1000})
function _PYTHON_TOGGLE()
	python:toggle()
end

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, id=1001})
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true, id=1002})
function _NODE_TOGGLE()
	node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true, id=1003})
function _NCDU_TOGGLE()
	ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true, id=1004})
function _HTOP_TOGGLE()
	htop:toggle()
end




-- new term
-- local M = {}
-- local Terminal = require'toggleterm.terminal'.Terminal

-- M.toggle = function()
--   local count = 0

--   for char in string.gmatch(vim.api.nvim_eval("sha256(getcwd())"), '%S') do
--     count = count + string.byte(char)
--   end

--   local term = Terminal:new({ count = count })

--   term:toggle()
-- end
-- return M

-- nmap <silent> tt <Cmd>lua require('project_term').toggle()<CR>
function ToggleNewTerm()
    local term = Terminal:new()
    term:toggle()
end
vim.cmd([[
    nnoremap <silent> <C-t> <cmd>lua ToggleNewTerm()<cr>
]])


