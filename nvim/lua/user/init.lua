vim.cmd [[packadd packer.nvim]]
require('user.packer')
require('user.set')
require('user.lsp')
require('user.telescope')
require("nvim-dap-virtual-text").setup()
require('lualine').setup()
require("dapui").setup(require('user.dap'))
