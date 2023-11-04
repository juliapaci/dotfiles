vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                    -- packer
    use 'mbbill/undotree'                           -- undo tree
    -- use {
    --     'numToStr/Comment.nvim',                    -- comments
    --     require('Comment').setup()
    -- }
    use 'norcalli/nvim-colorizer.lua'               -- colourizer
    use 'https://github.com/conweller/muted.vim'    -- color scheme

    use {
        'numToStr/Comment.nvim',                    -- comments
        require('Comment').setup()
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use {                                           -- lsp
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
        }
    }
end)
