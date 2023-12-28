
local util = require 'lspconfig.util'

local root_files = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac', -- AutoTools
}

local default_capabilities = {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = { 'utf-8', 'utf-16' },
}

return {
    default_config = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "clang-tidy-checks=bugprone-*, readability-*",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--header-insertion=iwyu",
            "--pch-storage=memory",
            "--cross-file-rename=true",
            "--fallback-style=Google",
            "--header-insertion-decorators"
            "--function-arg-placeholders=true",
            "-j=12",
            "--pretty",
            "--enable-config",
            "--query-driver=/usr/local/bin/g++",
        },
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    capabilities = default_capabilities
}