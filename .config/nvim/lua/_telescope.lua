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
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
