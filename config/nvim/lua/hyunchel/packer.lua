-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('EdenEast/nightfox.nvim')
    vim.cmd('colorscheme nightfox')

    use('nvim-treesitter/nvim-treesitter', { run = 'TSUpdate' })
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")

    use { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' }

    -- LSP support
    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    -- Autocompletion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('L3MON4D3/LuaSnip')

    -- Rest
    use("github/copilot.vim")
    use("vimwiki/vimwiki")
    use("junegunn/fzf", { ["do"] = function() vim.fn["fzf#install"]() end })
    use("junegunn/fzf.vim")
    use("fatih/vim-go") -- using this for auto imports...
end)
