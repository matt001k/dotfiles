require('telescope').setup {
  defaults = {
    disable_devicons = false,
  },
  pickers = {
  },
  find_files = {
      hidden = true,
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  }
}

local function git_search()
  require('telescope.builtin').git_files({
    use_git_root = true,
    recurse_submodules = true,
  })
end

local function find()
  require('telescope.builtin').find_files({
    hidden = true,
  })
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', find, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})
vim.keymap.set('n', '<leader>fg*', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fgg', git_search, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', builtin.search_history, {})
vim.keymap.set('n', '<leader>fc', builtin.command_history, {})
require("telescope").load_extension "file_browser"
require('telescope').load_extension('fzf')

-- open file_browser with the path of the current buffer
vim.keymap.set("n",
  "<leader>n",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
