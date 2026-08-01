local capabilities = vim.lsp.protocol.make_client_capabilities()

local pyright_settings = {
  python = {
    pythonPath = vim.env.CONDA_PREFIX and vim.env.CONDA_PREFIX .. "/bin/python" or nil,
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "openFilesOnly",
      useLibraryCodeForTypes = true,
    },
  },
}

vim.lsp.config("pyright", {
  capabilities = capabilities,
  settings = pyright_settings,
})

vim.lsp.enable("pyright")
vim.lsp.enable("ruff")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({
      name = "ruff",
      async = false,
    })
  end,
})

local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = vim.env.CONDA_PREFIX .. "/bin/python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    python = vim.env.CONDA_PREFIX .. "/bin/python",
  },
}
