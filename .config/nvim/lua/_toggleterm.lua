require("toggleterm").setup{
  close_on_exit = true,
  auto_scroll = false,
  float_opts = {
    border = 'shadow',
    winblend = 3,
    title_pos = 'left',
  },
}

-- Keymap
vim.api.nvim_set_keymap(
  'n',
  '<leader>t',
  ':ToggleTerm size=20 dir=%:p:h direction=horizontal<CR>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  't',
  '<c-t>',
  '<Cmd>ToggleTerm size=20 dir=%:p:h direction=horizontal<CR>',
  { noremap = true }
)
