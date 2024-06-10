vim.opt.laststatus = 2              -- idk what this does lol
vim.opt.statusline = ""             -- Reset
vim.opt.statusline:append " %t "    -- Tail
vim.opt.statusline:append " %m "    -- Modified
vim.opt.statusline:append " %=%y "  -- FileType
