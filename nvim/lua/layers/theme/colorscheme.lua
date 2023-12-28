

------------------------------
-- colorscheme
------------------------------
-- augroup MyColors
--     autocmd!
--     autocmd ColorScheme * call MyHighlights()
-- augroup END
-- silent! colorscheme dracula

vim.g.dracula_colorterm = 1
-- guifg=#8bc56f

-- autocmd ColorScheme dracula runtime dracula.vim
vim.cmd([[
    augroup DraculaOverrides
    autocmd!
    autocmd ColorScheme dracula runtime dracula.vim
    autocmd ColorScheme dracula highlight Normal cterm=NONE ctermbg=NONE gui=NONE guibg=#1e1e1e
    autocmd ColorScheme dracula highlight Comment guifg=#8bc56f
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
