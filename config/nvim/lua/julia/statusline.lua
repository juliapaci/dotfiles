vim.opt.laststatus = 2              -- always show status line
vim.opt.statusline = ""             -- Reset
vim.opt.statusline:append " %f "    -- relative directory
vim.opt.statusline:append " %m "    -- Modified
vim.opt.statusline:append " %=%n "  -- buffer number
