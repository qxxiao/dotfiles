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

-- 创建命令
vim.cmd [[ command! Gcc execute '!gcc -g ' ]] -- add format command