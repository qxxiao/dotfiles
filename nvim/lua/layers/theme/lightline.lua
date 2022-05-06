
-- status line

vim.o.laststatus=2
vim.o.showmode=false
vim.g.lightline = {
    colorscheme="one",
    background="dark", --for one colorscheme
    -- colorscheme='dracula',
    enable={ tabline=0 },
    active={
        -- left={{ 'mode', 'paste' }, { 'gitbranch', 'readonly', 'relativepath', 'modified' }},
        left={{ 'mode', 'paste' }, { 'GitBranch', 'readonly', 'LightLineFilename', 'modified' }},
    },
    component_function={
        GitBranch='GitBranch',
        LightLineFilename='LightLineFilename'
    }
}

-- %:~:. 使用～的路径去除当前工作目录
vim.cmd([[
    function! GitBranch() 
        let branch = FugitiveHead()
        if branch != ''
            return " " . branch
        endif
        return ''
    endfunction

    function! LightLineFilename()
        return expand('%:~:.')
    endfunction
]])

-- function! LightLineFilename()
--     let root = getcwd()
--     let path = expand('%:p')
--     if path[:len(root)-1] == root
--         return path[len(root)+1:]
--     endif
--     return expand('%')
-- endfunction