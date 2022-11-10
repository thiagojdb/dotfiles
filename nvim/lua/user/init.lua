require('user.packer')
require('user.set')
require('user.lsp')
require('user.dap')
vim.cmd [[packadd packer.nvim]]
require("mason").setup()
require("nvim-dap-virtual-text").setup()

