return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    require('telescope').setup {
      defaults = {
        layout_strategy = 'vertical',
        layout_config = { 
          height = 0.95, 
          width = 0.95, 
          prompt_position = 'bottom',
          mirror = true
        },
      },
    }
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, desc = "Telescope find files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Telescope search word under cursor or selection" })
    vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = "Telescope find references" })
    vim.keymap.set('n', '<leader>lss', builtin.lsp_document_symbols, { desc = "Telescope find document symbols" })
    vim.keymap.set('n', '<leader>lsa', builtin.lsp_workspace_symbols, { desc = "Telescope find workspace symbols" })
  end
}
