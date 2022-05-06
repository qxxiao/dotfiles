

------------------------------
-- colorscheme
------------------------------
-- augroup MyColors
--     autocmd!
--     autocmd ColorScheme * call MyHighlights()
-- augroup END
-- silent! colorscheme dracula

vim.g.dracula_colorterm = 1
-- autocmd ColorScheme dracula highlight! SignColumn guifg=:Normal
-- guifg=#8bc56f

vim.cmd([[
    augroup DraculaOverrides
    autocmd!
    autocmd ColorScheme dracula runtime dracula.vim
    autocmd ColorScheme dracula highlight Normal cterm=NONE ctermbg=NONE gui=NONE guibg=#1e1e1e
    autocmd ColorScheme dracula highlight Comment guifg=#8bc56f guibf=:Normal
    augroup end
]])
vim.cmd ([[
try
  silent! colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  echo "colorscheme dracula failed"
  colorscheme default
  set background=dark
endtry
]])


-- " colorscheme dracula
--  " augroup DraculaOverrides
--  "        autocmd!
--  "        autocmd ColorScheme dracula highlight! Normal ctermbg=NONE ctermfg=NONE guibg=None guifg=None
--  "        " autocmd ColorScheme dracula highlight! NonText guibg=None guifg=None
--  "        autocmd ColorScheme dracula highlight! SignColumn guibg=None guifg=None
--  "        autocmd ColorScheme dracula highlight! EndOfBuffer guifg=#282a36
--  "        autocmd ColorScheme dracula highlight! LineNr guibg=None guifg=#55596d
--  "        " highlight CursorLineNr guifg=#7d828d
--  "        autocmd ColorScheme dracula highlight! VertSplit gui=NONE guibg=None guifg=#3b3e51
--  "        autocmd ColorScheme dracula highlight! DraculaWinSeparator guibg=None guifg=#3b3e51
--  "        autocmd ColorScheme dracula highlight! IndentBlanklineChar guifg=#3b3e51 gui=nocombine
--  "        autocmd ColorScheme dracula highlight! IndentBlanklineContextChar guifg=#55596d gui=nocombine
--  "        autocmd ColorScheme dracula highlight! FloatermBorder guibg=NONE guifg=#3b3e51
--  "        autocmd ColorScheme dracula highlight! SignifySignAdd guibg=none guifg=green
--  "        autocmd ColorScheme dracula highlight! SignifySignChange guibg=none guifg=yellow
--  "        autocmd ColorScheme dracula highlight! SignifySignDelete guibg=none guifg=red
--  "        autocmd ColorScheme dracula highlight! TroubleSignOther guibg=None guifg=green
--  "        autocmd ColorScheme dracula highlight! TroubleFoldIcon guifg=None
--  "        autocmd ColorScheme dracula highlight! TroubleCount guibg=None
--  "        autocmd ColorScheme dracula highlight! TelescopeBorder guifg=#3b3e51
--  "        autocmd ColorScheme dracula highlight! TelescopePromptBorder guifg=#3b3e51
--  "        autocmd ColorScheme dracula highlight! TelescopeResultsBorder guifg=#3b3e51
--  "        " autocmd ColorScheme dracula highlight! CmpPmenu guibg=#000
--  "        " autocmd ColorScheme dracula highlight! CmpPmenuBorder guibg=#000
--  "        autocmd ColorScheme dracula runtime after/plugin/dracula.vim
--  "        autocmd ColorScheme dracula syntax enable
--  "    augroup end