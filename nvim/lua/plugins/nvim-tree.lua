-- documented in ':help nvim-tree.option'
-- default will show icon by default if no icon is provided

-- setup
-- 关于目录的说明：
-- 每个buffer打开都有其相对路径/名称
-- 如果跳到某个文件/buffer可能会改变cwd
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup({
    disable_netrw = true, -- disables netrw completely
    hijack_netrw = true, -- hijack netrw window on startup
    open_on_setup = false,
    -- will not open on setup if the filetype is in this list
    ignore_ft_on_setup = {"startify", "dashboard", "alpha"}, 
    -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    open_on_tab = false,
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = false,
    -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    update_cwd = true,
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {  -- 同步tree buf和文件buffer的内容 cwd
        enable = true,
        update_cwd = true,
        ignore_list = {}
    },
    -- system open command (`s` in the tree by default)
    system_open = {cmd = "", args = {}},
    filters = {dotfiles = true, custom = {}},
    actions = {  --default
        open_file = {
            quit_on_open=false, -- if true, will quit the tree when opening a file
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },

    view = {
        width = 30, -- "20%"
        hide_root_folder = false,
        side = 'left',
        signcolumn='yes', -- yes,no,auto 符号列显示诊断信息

        mappings = {
            -- if true, it will only use your list to set the mappings
            custom_only = false, -- 使用合并默认映射
            list = {
                {key = {"o", "l", "<2-LeftMouse>"},cb = tree_cb("edit")}, 
                {key = {"<cr>", "<2-RightMouse>"}, cb = tree_cb("cd")}, -- cd dir

                {key = "v", cb = tree_cb("vsplit")},
                {key = "s", cb = tree_cb("split")},
                {key = "t", cb = tree_cb("tabnew")},
                {key = "S", cb = tree_cb("system_open")},

                -- {key = "<bs>", cb = tree_cb("close_node")},
                -- {key = "<Tab>", cb = tree_cb("preview")},
                -- {key = "R", cb = tree_cb("refresh")},
                -- {key = "P", cb = tree_cb("parent_node")},
                -- {key = "a", cb = tree_cb("create")},
                -- {key = "d", cb = tree_cb("remove")},
                -- {key = "D", cb = tree_cb("trash")},
                -- {key = "r", cb = tree_cb("rename")},
                -- {key = "x", cb = tree_cb("cut")},
                -- {key = "c", cb = tree_cb("copy")},
                -- {key = "y", cb = tree_cb("copy_name")},
                -- {key = "Y", cb = tree_cb("copy_path")},
                -- {key = "gy", cb = tree_cb("copy_absolute_path")},
                -- {key = "p", cb = tree_cb("paste")},
                -- {key = "q", cb = tree_cb("close")},
                -- {key = "?", cb = tree_cb("toggle_help")},
                -- {key = "s", cb = tree_cb("system_open")},
                -- {key = ".", cb = tree_cb("run_file_command")},
                -- { key = "<C-k>", cb=tree_bc("toggle_file_info" )},
            }
        },
        number =false,
        relativenumber = false,
    },
    diagnostics = {
        enable = true, --false 
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },

    renderer={
        icons = {
            glyphs={
                default = "",
                symlink = "",
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌"
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                }
            } 
        },
    }
})

-- set var
-- https://github.com/kyazdani42/nvim-tree.lua
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 0  -- append a trailing slash
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_icon_padding = ' '
-- 注意的是，每个buffer包括目录树，当前的buffer不同，其相对路径/pwd可能不同
-- change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
vim.g.nvim_tree_respect_buf_cwd = 1 -- show current buf cwd in nvim-tree
vim.g.nvim_tree_create_in_closed_folder = 0
vim.g.nvim_tree_special_files={
    ["README.md"]=1,
    MAKEFILE=1,
    Makefile=1,
    ["readme.md"]=1,
}
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
}

--------------------------------
-- set keymap
local map =require('utils').map
map("n", "<leader>e", ":NvimTreeToggle<CR>", {silent = true})
map("n", "<leader>ee", ":NvimTreeFocus<CR>", {silent = true})

-- see :help nvim_tree_highlight`
-- 避免被覆盖，直接highlight
-- vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=#21252B guifg=#b7c8da")

vim.cmd("highlight NvimTreeNormal guibg=#21252B guifg=#b7c8da")
-- vim.cmd("highlight NvimTreeFolderIcon  guifg=#4994c4")
vim.cmd("highlight NvimTreeFolderName guifg=#00a6fc gui=bold" )
vim.cmd("highlight NvimTreeOpenedFolderName guifg=#00a6fc gui=bold" )
vim.cmd("highlight NvimTreeEmptyFolderName guifg=#00a6fc gui=bold" )
vim.cmd("highlight NvimTreeSymlink guifg=#9778ef")
vim.cmd([[autocmd BufEnter * silent! lcd %:p:h]])