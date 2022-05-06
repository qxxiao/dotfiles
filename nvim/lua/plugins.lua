

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
-- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "folke/which-key.nvim" -- Keybindings for vim-which-key
--   use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
--   use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/toggleterm.nvim"

--   use "ahmedkhalf/project.nvim"
--   use "lewis6991/impatient.nvim"
--   use "goolord/alpha-nvim"
--   use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

    -- Colorschemes
    -- 说明：使用lock不进行更新操作，添加了c.vim cpp.vim go.vim语法格式
    -- 但是没有没有语法解析支持函数内的参数变量--需要lsp的高亮clnagd?
    -- in ~/.local/....../dracula/after/syntax/
    use {"dracula/vim", as = "dracula"}
    use {"lunarvim/darkplus.nvim", disable = true} -- notactive
    use {"lunarvim/colorschemes", disable = true} -- A bunch of colorschemes you can try out
    --  status line
    use {'itchyny/lightline.vim'}
    use {"akinsho/bufferline.nvim"}

    --------------------------------
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "p00f/nvim-ts-rainbow" -- Rainbow colors for treesitter
    use "lukas-reineke/indent-blankline.nvim" -- 缩进显示
    use "numToStr/Comment.nvim" -- comment plug
    use "aperezdc/vim-template" -- template


  -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- language server installer
    --   use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    --   use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    -- lang enchanced plugins
    -- go
    -- gotest

    --  cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-nvim-lsp" -- cmp source for lsp 扩展了更多的类型
    use "hrsh7th/cmp-path" -- cmp source for path completions
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use {"hrsh7th/cmp-nvim-lua", disable = true} -- neovim's Lua runtime API
    -- snipp
    use "L3MON4D3/LuaSnip" --snippet engine
    -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Telescope
    use "nvim-telescope/telescope.nvim"


  -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate'
    }
    -- 基于Treesitter的模版补全---实现类的定义等
    use {
        "Badhi/nvim-treesitter-cpp-tools", -- 添加keybind
    }
--   use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
    use "tpope/vim-fugitive" -- for lightline git status
    use "lewis6991/gitsigns.nvim"
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
