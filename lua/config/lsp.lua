local capabilities = vim.lsp.protocol.make_client_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
  },
})

require("mason-lspconfig").setup_handlers({
  function(server_name)
    vim.lsp.config(server_name, {
      capabilities = capabilities,
    })

    vim.lsp.enable(server_name)
  end,
})
