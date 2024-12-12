local function init_telescope()
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {noremap = true, desc = "Telescope find files"})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
  vim.keymap.set('n', '<leader>lR', builtin.lsp_references, { desc = "Telescope find references" })
end

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = init_telescope
}
