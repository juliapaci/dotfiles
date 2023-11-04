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

lsp.set_sign_icons({
  error = 'E',
  warn = 'W',
  hint = 'H',
  info = 'I'
})

vim.diagnostic.config({virtual_text = false})

vim.keymap.set("n", "L", function()
    local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
    if not next(diagnostics) then
        print(' ')
        return
    end
    print(diagnostics[1].message)
end)
