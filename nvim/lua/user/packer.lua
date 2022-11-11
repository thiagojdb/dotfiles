return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  -- File search
  use("nvim-lua/plenary.nvim") 
  use("nvim-telescope/telescope.nvim")
  use("ThePrimeagen/git-worktree.nvim")
  use("nvim-lua/popup.nvim")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind-nvim")
  use("nvim-lua/lsp_extensions.nvim")
  use("glepnir/lspsaga.nvim")
  use("simrat39/symbols-outline.nvim")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("mbbill/undotree")
  use("williamboman/mason.nvim")
  use("mfussenegger/nvim-jdtls")


  -- I don't even know, but code looks pretter
  use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
  })

  use("ThePrimeagen/harpoon")

  -- Colorscheme
  use("gruvbox-community/gruvbox")
  use({"catppuccin/nvim", as = "catppuccin" })
  use('tanvirtin/monokai.nvim')

  --Set this up later

--  use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")
--
--
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

end)


