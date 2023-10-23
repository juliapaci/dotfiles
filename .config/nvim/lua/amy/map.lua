vim.g.mapleader = ","

vim.keymap.set("", "j", "gj")                   -- move down when lines wrap
vim.keymap.set("", "k", "gk")                   -- move up when lines wrap
vim.keymap.set("n", "<CR>", "<cmd>noh<CR>")     -- remove highlighting
vim.keymap.set("", "S", ":s//g<left><left>")    -- replace inline
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")      -- write to file
vim.keymap.set("n", "<C-a>", "ggVG")            -- select all

-- split navigation --
vim.keymap.set("", "<C-h>", "<C-w>h")           -- up
vim.keymap.set("", "<C-j>", "<C-w>j")           -- down
vim.keymap.set("", "<C-k>", "<C-w>k")           -- up
vim.keymap.set("", "<C-l>", "<C-w>l")           -- right

-- plugin related --
vim.keymap.set("n", "<A-r>", function() vim.cmd("UndotreeToggle") end)      -- toggle undo tree ui
vim.keymap.set("x", "ff", "<Plug>(comment_toggle_linewise_visual)")         -- toggle comments
vim.keymap.set('n', 'ff', function()
    return vim.v.count == 0
    and '<Plug>(comment_toggle_linewise_current)'
    or '<Plug>(comment_toggle_linewise_count)'
end, { expr = true })                                                       -- toggle comments
