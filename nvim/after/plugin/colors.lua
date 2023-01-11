vim.g.user_colorscheme = "catppuccin"

require("catppuccin").setup({
	transparent_background = true,
});

function ColorMyPencils()
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.tokyonight_transparent_sidebar = true
    vim.g.tokyonight_transparent = true
    vim.g.gruvbox_invert_selection = '0'
    vim.opt.background = "dark"

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.cmd("colorscheme " .. vim.g.user_colorscheme)

end
ColorMyPencils()
