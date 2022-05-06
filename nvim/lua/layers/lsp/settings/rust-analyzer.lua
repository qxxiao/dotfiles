return{
    cmd="{ "rust-analyzer" }",
    filetypes={ "rust" },
    rootdir=root_pattern("Cargo.toml", "rust-project.json"),
    settings={
        ["rust-analyzer"] = {}
    }
}