vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use "nvim-lua/plenary.nvim"
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

  use({
      "rebelot/kanagawa.nvim",
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"}, { 'nvim-telescope/telescope.nvim' } }
  }

  use 'mbbill/undotree'

  use 'folke/lazydev.nvim'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim"
    "j-hui/fidget.nvim",
    "saghen/blink.cmp"
  }

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  use 'mfussenegger/nvim-lint'

  use { 'mhartington/formatter.nvim' }
end)

