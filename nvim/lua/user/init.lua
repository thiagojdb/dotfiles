vim.cmd [[packadd packer.nvim]]
require('user.packer')
require('user.set')
require('user.lsp')
require('user.dap')
require("nvim-dap-virtual-text").setup()
require('lualine').setup()

