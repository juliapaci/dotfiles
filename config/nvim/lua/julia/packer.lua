vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                    -- packer
    use 'mbbill/undotree'                           -- undo tree
    use 'norcalli/nvim-colorizer.lua'               -- colourizer
    use 'Alligator/accent.vim'    -- color scheme
    use {                                           -- comments
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'seblj/nvim-echo-diagnostics'
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
            {'L3MON4D3/LuaSnip'},
        }
    }
    use {
        'lervag/vimtex',
        init = function() vim.g.vimtex_view_method = "zathura" end
    }
    use 'tidalcycles/vim-tidal'
end)
