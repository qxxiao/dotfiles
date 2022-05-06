require("base")
require("keymap")
require("autocmd")
-- use
require ("plugins")
-- plugin config
require("layers")



-- scripts for use
-- if you add path to rtp, .lua should be found in [path]/lua/filename.lua
-- vim.opt.rtp:append(vim.fn.stdpath "config".."/scripts") 
require("scripts.generate_compile_commands") -- in lua/scripts/generate_compile_commands.lua
