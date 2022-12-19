local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap

vim.keymap.set("n", "<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

vim.keymap.set("n", "<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

vim.keymap.set("n", "<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)

vim.keymap.set("n", "<leader>pb", function()
    require('telescope.builtin').buffers()
end)

vim.keymap.set("n", "<leader>vh", function()
    require('telescope.builtin').help_tags()
end)

vim.keymap.set("n", "<leader>vrc", function()
    require('user.telescope').search_dotfiles()
end)
