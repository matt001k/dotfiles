require('telescope').setup {
  defaults = {
    disable_devicons = false,
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
    }
  },
  pickers = {
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require("telescope").load_extension "file_browser"

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>n",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
