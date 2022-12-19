vim.keymap.set("n","<leader>b", function() require'dap'.toggle_breakpoint() end)
vim.keymap.set("n","<leader>B", function() require'dap'.set_breakpoint() end)
vim.keymap.set("n","<F5>", function() require'dap'.continue() end)
vim.keymap.set("n", "<F12>", function() require'dapui'.toggle() end)


