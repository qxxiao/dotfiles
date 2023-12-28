" An example for a vimrc file.


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" ==========================================
set history=100
set ruler              " show the cursor position all the time
set showcmd            " display  commands
set mouse=a          " allow mouse usage (all modes)
set selection=exclusive
set selectmode=mouse,key

set nu              "设置显示行号
syntax enable
syntax on           "显示语法高亮
set showmatch
set hlsearch        "搜索显示高亮
set incsearch       " 在搜索时，输入的词句的逐字符高亮
"set background=dark "设置背景为黑色
set clipboard=unnamed "共用系统的剪切板,本来是+/*寄存器
set cursorline      "光标所在处显示光标线
set scrolloff=5    "设置光标移动的时候，上下至少都有五行的可显示部分
set tabstop=4       "设置tab键为4个空格
set softtabstop=4   " 如果 tabstop=4  那么按一次tab 插入4个空格，
"按两次tab将会变成制表符， 逢8空格进1制表符
set shiftwidth=4    " 自动缩进宽度
set shiftround

" 着色模式
set t_Co=256

"colorscheme evening
"colorscheme darkblue
"colorscheme torte
"colorscheme default
"colorscheme wombat256mod

" 字体 && 字号
"set guifont=Monaco:h10
set guifont=Consolas:h10

"侦测文件类型
filetype on
"载入文件类型插件
filetype plugin on
"为特定文件类型载入相关缩进文件
filetype indent on
" 启用自动补全
filetype plugin indent on 
set fileencoding=utf-8 "新建文件使用的编码
set encoding=utf-8 "用于显示的编码，仅仅是显示
set fileformat=unix

" keymap
inoremap ,, <Esc>

" v-mod w and n-mod r
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

" Set cursor shape and color
" default
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"

