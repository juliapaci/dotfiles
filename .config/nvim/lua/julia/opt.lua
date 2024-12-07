-- tab --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- split --
vim.opt.splitbelow = true               -- focus new window
vim.opt.splitright = true               -- focus new window

-- wrapping --
vim.opt.wrap = true                     -- wrap text
vim.opt.breakindent = true              -- indent wrapped lines

-- indentation --
vim.opt.autoindent = true               -- copies indentation of prev line when appropriate
vim.opt.smartindent = true              -- auto indent when appropriate
-- vim.opt.list = true                     -- disable with nolist
-- vim.opt.lcs:append "space:."            -- show whitespace as .

-- search --
vim.opt.hlsearch = true                 -- highlight all search matches
vim.opt.incsearch = true                -- highlight while searching
vim.opt.ignorecase = true
vim.opt.smartcase = true                -- only match cases when cases are used
vim.opt.iskeyword=vim.opt.iskeyword-"_" -- underscores work like spaces when jumping words

-- ui --
vim.opt.number = true                   -- line numbers
vim.opt.relativenumber = true           -- relative line numbers
vim.opt.showmode = false                -- disable line number visibility in visual mode
vim.opt.signcolumn = "yes"              -- always display multiple columns for signs
vim.opt.cmdheight = 2                   -- 2 line cmd
vim.opt.showmode = false                -- dont show mode on last line

vim.opt.background  = "dark"             -- set background to dark
-- vim.opt.termguicolors = true
vim.g.accent_colour = 'yellow'
vim.g.accent_no_bg = true
vim.g.accent_darken = true
vim.cmd.colorscheme("accent")            -- color scheme
vim.cmd.highlight('Type ctermfg=250')
vim.cmd.highlight('Normal ctermfg=253')
vim.cmd.highlight('StatusLine ctermbg=0')

-- misc --
vim.opt.mouse = ""                      -- disable mouse
vim.opt.title = true                    -- window title as file names and/or paths
vim.opt.clipboard:append "unnamedplus"  -- always use the clipboard
vim.opt.scrolloff = 8                   -- 8 screen line space buffer
vim.cmd.filetype("plugin on")           -- enable filetype plugins

-- auto commands --
vim.api.nvim_create_autocmd("VimEnter", { callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" } end, }) -- remove comment on newline
vim.api.nvim_create_autocmd("VimEnter", { callback = function () vim.cmd.highlight("clear SignColumn") end, })                          -- clear gutter colours
vim.api.nvim_create_autocmd({ "BufWritePre" }, { -- remove trailing whitespace
    callback = function()
        save_cursor = vim.fn.getpos(".")         -- TODO: maybe use winsaveview()? or markers
        vim.cmd([[%s/\s\+$//e]])
        vim.cmd([[%s/\n\+\%$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
