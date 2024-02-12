vim.keymap.set('n', '<leader>g', ':Git<Space>')
vim.keymap.set('n', '<leader>gs', ':Git<CR>')
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>gca', ':Git commit --amend<CR>')
vim.keymap.set('n', '<leader>gp', ':Git push<CR>')
vim.keymap.set('n', '<leader>gpf', ':Git push --force<CR>')
vim.keymap.set('n', '<leader>ga', ':Git add<space>')
vim.keymap.set('n', '<leader>gaa', ':Git add -A<CR>')
vim.keymap.set('n', '<leader>gr', ':Git rebase<space>')
vim.keymap.set('n', '<leader>grl', ':Git reflog<CR>')

require("git-conflict").setup {
  default_mappings = {
    ours = 'o',
    theirs = 't',
    none = '0',
    both = 'b',
    next = 'n',
    prev = 'p',
  },
}
vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in '..vim.fn.expand('<afile>'))
    vim.keymap.set('n', 'cww', function()
    end)
  end
})
