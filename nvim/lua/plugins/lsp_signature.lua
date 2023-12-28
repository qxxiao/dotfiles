

local lsp_signature = require("lsp_signature")


local cfg={
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
}

lsp_signature.setup(cfg)