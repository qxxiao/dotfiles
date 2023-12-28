
-- more option config
-- :help indent-blankline

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}
vim.g.indent_blankline_context_patterns = {
	"class",
	"return",
	"function",
	"method",
	"^if",
	"^while",
	"jsx_element",
	"^for",
	"^object",
	"^table",
	"block",
	"arguments",
	"if_statement",
	"else_clause",
	"jsx_element",
	"jsx_self_closing_element",
	"try_statement",
	"catch_clause",
	"import_statement",
	"operation_type",
}

vim.g.indent_blankline_use_treesitter = false -- 关闭treesitter,例如空行也会显示
-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"
-- indent char , or:  ¦, ┆, │, ⎸, for utf-8 
vim.g.indent_blankline_char = '┊' -- or use default
vim.cmd([[hi! IndentBlanklineContextChar guifg=#c197ed gui=nocombine]])
require("indent_blankline").setup {

    -- context is off by default
    show_current_context = true,
}
