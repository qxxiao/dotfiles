
-----------------------------
-- 说明：对于使用vi newfile命令创建新文件的插件
-- 对于在nvim-tree创建新文件是不生效的，或者使用命令模式创建新文件
------------------------------
-- 存放模板的目录
-- vim.g.templates_directory = {'~/.config/nvim/templates'}
vim.g.templates_directory = { vim.fn.stdpath "config" .. "/templates"}
vim.g.templates_global_name_prefix = 'skeleton'

-- 自定义变量和函数，填充到模版文件对应的占位符中
vim.g.templates_user_variables={
    {"Author","Templates_getAuthor"},
    {"MYDATE","Templates_getDate"}
}

vim.cmd([[
    func Templates_getAuthor()
        return 'xiao'
    endfunc

    func Templates_getDate()
	    return strftime("%m/%d %Y %H:%M:%S")
    endfunc
]])

-- or use vim cmd
---------------------------------
-- vim.cmd([[
--     let g:templates_directory="~/.config/nvim/templates"
--     let g:templates_global_name_prefix="skeleton"

--     let g:templates_user_variables= [['MYDATE', 'Templates_getDate'], ['Author', 'Templates_getAuthor'],]

--     func Templates_getDate()
-- 	    return strftime("%m/%d %Y %H:%M:%S")
--     endfunc

--     func Templates_getAuthor()
--         return 'xiao'
--     endfunc
-- ]])