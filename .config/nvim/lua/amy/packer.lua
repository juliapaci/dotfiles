vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                    -- packer
    use 'mbbill/undotree'                           -- undo tree
    use 'dense-analysis/ale'                        -- lsp
    -- use 'hrsh7th/cmp-nvim-lsp'                      -- lsp
    use 'windwp/nvim-autopairs'                     -- auto pairs
    use {
        'numToStr/Comment.nvim',                    -- comments
        require('Comment').setup()
    }
    use 'norcalli/nvim-colorizer.lua'               -- colourizer
    use 'https://github.com/conweller/muted.vim'    -- muted color scheme
end)
