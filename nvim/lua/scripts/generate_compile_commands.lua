
vim.cmd([[
    function! s:generate_compile_commands()
        if empty(glob('CMakeLists.txt'))
            echo "Cant't find CMakeLists.txt"
            return
        endif
        execute '!cmake -DCMAKE_BUILD_TYPE=debug 
            \ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build'
    endfunction
    command! -nargs=0 CmakeGcc :call s:generate_compile_commands()
]])

