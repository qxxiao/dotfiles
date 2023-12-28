-------------------------------------
-- simple config for neovim plugins
-------------------------------------

-- colorscheme // Best to put at the end
require("layers.theme")


-- file explorer
require("plugins.alpha")
require("plugins.nvim-tree")


-- code completion and lightling
----------------------------------
require("plugins.nvim-treesitter")
-- cmp
require("plugins.cmp")
-- autopairs
require("plugins.nvim-autopairs")
require("plugins.Comment")
require("plugins.nvim-ts-rainbow") -- for rainbow config
-- require("plugins.indent-blankline") -- for indent line config
require("plugins.vim-template") -- for template config
require("plugins.whichkey")
require("plugins.telescope")
require("plugins.toggleterm")

require("plugins.gitsigns") -- for git sign config
--------------------------
-- layers config
--------------------------
-- lsp
require("plugins.lsp_signature")
require("plugins.aerial")
require("layers.lsp")




