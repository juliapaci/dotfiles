local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'clangd', 'rust_analyzer'},
  handlers = {
    lsp.default_setup,
  }
})

vim.diagnostic.config({
    virtual_text = false, underline = false
})

lsp.set_sign_icons({
  error = 'E',
  warn = 'W',
  hint = 'H',
  info = 'I'
})

-- echo diagnostics
local diag = require("echo-diagnostics")

diag.setup{
    show_diagnostic_number = false,
    show_diagnostic_source = false,
}

vim.opt.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", { callback = function() diag.echo_line_diagnostic() end })
