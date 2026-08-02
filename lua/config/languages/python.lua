local capabilities = vim.lsp.protocol.make_client_capabilities()

local debugpy_path = vim.fn.exepath("debugpy")
local python_path = vim.fn.exepath("python")

local pyright_settings = {
  python = {
    pythonPath = python_path ~= "" and python_path or nil,

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
  command = debugpy_path,
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    python = python_path,
  },
}
