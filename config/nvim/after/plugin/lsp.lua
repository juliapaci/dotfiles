local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

vim.lsp.config('julials', {
    cmd = {
        "julia",
        "--project=".."~/.julia/environments/lsp/",
        "--startup-file=no",
        "--history-file=no",
        "-e", [[
            using Pkg
            Pkg.instantiate()
            using LanguageServer
        depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
        project_path = let
            dirname(something(
                ## 1. Finds an explicitly set project (JULIA_PROJECT)
                Base.load_path_expand((
                    p = get(ENV, "JULIA_PROJECT", nothing);
                        p === nothing ? nothing : isempty(p) ? nothing : p
                    )),
                        ## 2. Look for a Project.toml file in the current working directory,
                        ##    or parent directories, with $HOME as an upper boundary
                        Base.current_project(),
                        ## 3. First entry in the load path
                        get(Base.load_path(), 1, nothing),
                        ## 4. Fallback to default global environment,
                        ##    this is more or less unreachable
                    Base.load_path_expand("@v#.#"),
                ))
            end
                    @info "Running language server" VERSION pwd() project_path depot_path
                    server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
        server.runlinter = true
            run(server)
        ]]
    },
    filetypes = { 'julia' },
    root_markers = { "Project.toml", "JuliaProject.toml" },
    settings = {}
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
      'clangd',         -- c/c++
      'rust_analyzer',  -- rust
      'zls',            -- zig
      'hls',            -- haskell
      'julials',        -- julia
      'glsl_analyzer',  -- glsl
      'tinymist'        -- typst
  },
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
