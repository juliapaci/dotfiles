vim.g.mapleader = ","

vim.keymap.set("", "j", "gj")                   -- move down when lines wrap
vim.keymap.set("", "k", "gk")                   -- move up when lines wrap
vim.keymap.set("n", "<CR>", "<cmd>noh<CR>")     -- remove highlighting
vim.keymap.set("", "S", ":s//g<left><left>")    -- replace inline
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")      -- write to file
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")    -- move code blocks and indent
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")    -- move code blocks and indent
vim.keymap.set("n", "J", "mzJ`z")               -- keep cursor in place when J
vim.keymap.set("n", "<C-d>", "<C-d>zz")         -- keep cursor in the middle when half page jumping
vim.keymap.set("n", "<C-u>", "<C-u>zz")         -- keep cursor in the middle when half page jumping
vim.keymap.set("x", "<leader>p", [["_dP]])      -- preserve copy register when pasting over
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])-- deleting to void register
vim.keymap.set("i", "<C-c>", "<Esc>")           -- to save multiline edit when <C-c> instead of <Esc>

-- split navigation --
vim.keymap.set("n", "<C-h>", "<C-w>h")          -- left
vim.keymap.set("n", "<C-j>", "<C-w>j")          -- down
vim.keymap.set("n", "<C-k>", "<C-w>k")          -- up
vim.keymap.set("n", "<C-l>", "<C-w>l")          -- right
vim.keymap.set("", "<C-A-h>", "<C-w><")         -- dec width
vim.keymap.set("n", "<C-A-j>", "<C-w>-")        -- dec height
vim.keymap.set("n", "<C-A-k>", "<C-w>+")        -- inc height
vim.keymap.set("n", "<C-A-l>", "<C-w>>")        -- inc width

-- for quickfix --
vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>");
vim.keymap.set("n", "<A-k>", "<cmd>cprev<CR>");

-- plugin related --
vim.keymap.set("n", "<A-r>", function() vim.cmd("UndotreeToggle") end)      -- toggle undo tree ui
vim.keymap.set("x", "ff", "<Plug>(comment_toggle_linewise_visual)")         -- toggle comments
vim.keymap.set("n", "<leader>mr", ":!pandoc -t pdf \"%:p\" -o \"%:t:r.pdf\"<CR>") -- vimtex sub
vim.keymap.set("n", "<leader>tr", ":!typst compile % %:t:r.pdf<CR>") -- vimtex sub
vim.keymap.set('n', 'ff', function()
    return vim.v.count == 0
    and '<Plug>(comment_toggle_linewise_current)'
    or '<Plug>(comment_toggle_linewise_count)'
end, { expr = true })                                                       -- toggle comments
