local map= require('utils').map

local lsp_installer =require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 管理lsp 
-- lspinfo
-- lspinstallinfo
local servers = { 
    "jsonls", 
    "sumneko_lua",
    "gopls",
    "pyright",
    "clangd", 
    "cmake",
    "jdtls",
    "rust_analyzer",
    "tsserver"
}
lsp_installer.setup({
    ensure_installed = servers, -- ensure these servers are always installed
    automatic_installation = true, -- automatically detect which servers to install
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- init servers
for _, server in pairs(servers) do
	local opts = {
		on_attach = require("layers.lsp.handlers").on_attach,
		capabilities = require("layers.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "layers.lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
