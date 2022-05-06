return {
    cmd={ "pyright-langserver", "--stdio" },
    filetypes= {"python"},
    settings={
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "strict", -- off,basic,strict,
            },
        }
    },
    single_file_support=true,
}