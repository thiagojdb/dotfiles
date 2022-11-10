local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>b", function()
  require'dap'.toggle_breakpoint()
end)


nnoremap("<leader>B", function()
  require'dap'.set_breakpoint()
end)


nnoremap("<F5>", function()
  require'dap'.continue()
end)


nnoremap("<F12>", function()
  require'dapui'.toggle()
end)
