----------------------------------------
-- use vim.cmd() / vim.api.nvim_command()
----------------------------------------

-- 更新plugins.lua后自动更新
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- 退出Vim光标样式
vim.cmd("au VimLeave * set guicursor=a:hor10-blinkon1")
vim.cmd("au ExitPre * set guicursor=a:hor10-blinkon1")

-- 自动格式化
vim.cmd([[
  augroup autoformat
    autocmd!
    autocmd BufWritePost * Format
  augroup end
]])

-- 解决 telescope 第一次打开文件无法折叠的问题 issue599
vim.cmd([[
    augroup fold_bug_solution
        autocmd!
        autocmd BufREad * autocmd BufWinEnter * ++once normal! zx
    augroup end
]])

------------------cmd
-- 创建简单的term分屏命令，
-- 也可以直接使用toggleterm插件提供的命令更快
vim.cmd([[
    command! Vst execute 'vsplit | term' 
    command! Spt execute 'split | term'
]])
