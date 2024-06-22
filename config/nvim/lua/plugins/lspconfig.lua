return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "onsails/lspkind.nvim",
    "williamboman/mason.nvim"
  },
  config = function()
    -- lspconfig
    local lspconfig = require("lspconfig")
    local function on_attach(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.cmd [[augroup LspFormatting
                  autocmd! * <buffer>
                  autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
                  augroup END]]
      end
    end

    -- python
    lspconfig.jedi_language_server.setup({
      on_attach = on_attach,
      settings = {
        init_options = {
          diagnostics = { enable = false }
        }
      }
    })

    lspconfig.ruff_lsp.setup({
      on_attach = on_attach
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = false
      })

    -- mason
    require("mason").setup({})
  end
}
