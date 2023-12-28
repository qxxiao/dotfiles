local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- 显示每行的诊断信息
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local bufMap=require('utils').bufMap
local function lsp_keymaps(bufnr)
  local opts = { silent = true }
  bufMap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  bufMap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  bufMap(bufnr, "n", "dt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  bufMap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  bufMap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

  bufMap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- doc
  bufMap(bufnr, "n", "<M-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- or...
  bufMap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  bufMap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  bufMap(bufnr,"n",  "do", '<cmd>lua vim.diagnostic.open_float({scope="line"})<CR>',opts) -- 当前行诊断信息
  bufMap(bufnr, "n", "dk", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  bufMap(bufnr, "n", "dj", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  bufMap(bufnr, "n", "dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  -- format commands
  -- leader f for telescope
  --   bufMap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]] -- add format command
end

M.on_attach = function(client, bufnr)
-- 自定义格式化插件可以
--   if client.name == "tsserver" then
--     client.resolved_capabilities.document_formatting = false
--   end
  if client.name == "clangd" then
    bufMap(bufnr, "n", "<leader>lh", "<Cmd>ClangdSwitchSourceHeader<CR>", { silent = true })
  end
  lsp_keymaps(bufnr)
  require "lsp_signature".on_attach()
  require("aerial").on_attach(client, bufnr)
  lsp_highlight_document(client)  -- 高亮文档中鼠标的位置单词
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
