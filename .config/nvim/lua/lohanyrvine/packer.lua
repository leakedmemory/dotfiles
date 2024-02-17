return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    use('nvim-lua/plenary.nvim')

    use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x' })

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-commentary')

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    })

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    use('nvim-tree/nvim-web-devicons')

    use('folke/trouble.nvim')

    use('nvim-lualine/lualine.nvim')

    use({ 'catppuccin/nvim', as = 'catppuccin' })

    use('xiyaowong/transparent.nvim')
end)
