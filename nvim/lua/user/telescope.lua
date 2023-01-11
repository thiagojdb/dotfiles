local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        ["<CR>"] = actions.select_default,
      },
    },


  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- d
      filetypes = { "png", "jpg", "pdf", "jpeg" },
      find_cmd = "rg"
    }
  },
})

require('telescope').load_extension('media_files')
require("telescope").load_extension("git_worktree")
-- require("telescope").load_extension("fzy_native")

local M = {}


M.search_dotfiles = function()
  require("telescope.builtin").git_files({
    prompt_title = "< VimRC >",
    cwd = '~/.config',
    hidden = true,
  })
end

local function set_background(content)
  local selected_image_path = '\\\\\\\\\\\\\\\\wsl.localhost\\\\\\\\Ubuntu'.. string.gsub(content, '/', '\\\\\\\\')
  local COMMAND = "silent !sed -i -E "
  local PATTERN = '\'s/("backgroundImage").*/\\"backgroundImage": "'.. selected_image_path ..'", /\' '
  local CONFIG_FILE_PATH = '/mnt/c/Users/thiago.sousa/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json';
  vim.cmd(COMMAND .. PATTERN .. CONFIG_FILE_PATH)
  --  sed -i -E 's/("backgroundImage").*/\"backgroundImage": "\\wsl.localhost\Ubuntu\\home\\thiago\\anime\\rose-pine-sword.jpg"/' /mnt/c/Users/thiago.sousa/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
  --  sed -i -E 's/("backgroundImage").*/\rararasputin/' something.txt
end

local function select_background(prompt_bufnr, map)
  local function set_the_background(close)

    local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
    set_background(content.cwd .. "/" .. content.value)
    if close then
      require("telescope.actions").close(prompt_bufnr)
    end
  end
  map("i", "<C-p>", function()
    set_the_background()
  end)

  map("i", "<CR>", function()
    set_the_background(true)
  end)
end

local function image_selector(prompt, cwd)
  return function()
    --require('telescope').extensions.media_files.media_files({
    require("telescope.builtin").find_files({
      prompt_title = prompt,
      cwd = cwd,

      attach_mappings = function(prompt_bufnr, map)
        select_background(prompt_bufnr, map)

        -- Please continue mapping (attaching additional key maps):
        -- Ctrl+n/p to move up and down the list.
        return true
      end,
    })
  end
end

M.anime_selector = image_selector("< Anime Bobs > ", "~/anime")

return M
