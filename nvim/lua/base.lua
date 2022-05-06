-- vim base option config
-- or use vim.o.optionName = value -- set vim option
local options = { 
    compatible = false,   --不兼容vi 即使&compatible=1
    -- 允许隐藏被修改的buffer, 即同一窗口打开另一文件
    -- or 会打开一个新的窗口
    hidden =true,
    background= "dark",
    number = true,
    relativenumber = false,
    numberwidth = 2,
    smartindent = true, 
    autoindent =true, 
    linebreak =true,  --软折行
    swapfile = false, --禁止生成swap文件
    ignorecase =true,
    infercase =true, --smartcase
    expandtab =true, --tab字符扩展为空格; 插入tab,CTRL-V键，再按 Tab 键
    tabstop = 4, -- tab键显示宽度，默认为8（如果插入的是tab才显示4个宽度）
    shiftwidth=4, -- 自动缩进时,缩进长度为4
    -- 一般：softtabstop<tabstop, 当插入达到tabstop空格，会转化为tab键--显示宽度为tabstop
    softtabstop=-1, -- 控制tab键实际插入的是空格还是tab字符，受到tabstop的影响, == shiftwidth=4
    
    smarttab =true ,
    shiftround =true,
    cursorline = true,  -- highlight the current line
    history = 500, --历史命令
    autoread = true,  
    autowrite =true,
    confirm = true, 
    showmode = false,
    showmatch = true,
    mouse = "a",                             -- 全部模式生效
    ffs = {"unix", "mac", "dos"},
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    
    backup = false,                          -- creates a backup file
    winaltkeys=yes,
    showtabline = 2,                         -- always show tabs
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    termguicolors = true,                    -- set term gui colors
    timeoutlen = 200,                        -- map key的超时时间ms
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program not allowed to be edited
    signcolumn = "yes:1",                    -- always show the sign column(number | yes:1 | yes | no)
    wrap = false,                            -- display lines as one long line
    splitbelow =true, --在下方分割
    splitright =true,
    -- fillchars = "eob: , vert:|, horz:-, vertical:|, horizontal:-", -- dont work
    cmdheight = 1,                           -- more space in the neovim command line
    -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    -- conceallevel = 0,                        -- so that `` is visible in markdown files
}

vim.opt.shortmess:append "c"
vim.opt.sessionoptions:append "globals"
vim.opt.fillchars:append "eob: ,"
-- set list manually; 使用时手动打开，:set list or :set nolist
-- vim.opt.list = true  
-- set lcs
vim.opt.listchars:append "tab:» , trail:·," --use :set list
vim.opt.diffopt:append "vertical" -- 默认为vertical打开diff文件
vim.opt.display:append "lastline"

for k, v in pairs(options) do
  vim.opt[k] = v
end
vim.cmd("syntax enable")
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd('filetype plugin indent on')

-- 光标样式
vim.g.t_SI = [[\<Esc>]50;CursorShape=1\x7]]
vim.g.t_SR = [[\<Esc>]50;CursorShape=2\x7]]
vim.g.t_EI = [[\<Esc>]50;CursorShape=0\x7]]
