vim.opt.mouse = ""                      -- disable mouse
vim.opt.hlsearch = true                 -- highlight all search matches
vim.opt.incsearch = true                -- highlight while searching
vim.opt.number = true                   -- line numbers
vim.opt.relativenumber = true           -- relative line numbers
vim.opt.title = true                    -- window title as file names and/or paths
vim.opt.clipboard:append "unnamedplus"  -- always use the clipboard
vim.opt.showmode = false                -- dont show mode on last line
vim.opt.background = "dark"             -- set background to dark
vim.opt.smartcase = true                -- only match cases when cases are used
vim.opt.scrolloff = 8                   -- 8 screen line space buffer
vim.opt.signcolumn = "yes"              -- always display multiple columns for signs
vim.opt.cmdheight = 2                   -- 2 line cmd
vim.cmd.filetype("plugin on")           -- enable filetype plugins
vim.opt.showmode = false                -- disable line number visibility in visual mode

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

-- comment stuff --
vim.api.nvim_create_autocmd("BufEnter", { callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" } end, }) -- remove comment on newline

-- cursor --
vim.opt.guicursor = "v:block"           -- for some reason i have to add this line instead???????
-- vim.opt.guicursor = ""                  -- set block cursor always

vim.cmd.colorscheme("muted")            -- color scheme
