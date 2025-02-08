return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'fannheyward/telescope-coc.nvim',
  },
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
      extensions = {
        coc = {
          prefer_locations = true, -- always use Telescope locations to preview references
        }
      }
    }

    -- Load the coc extension
    require('telescope').load_extension('coc')

    local builtin = require('telescope.builtin')
    -- Keep original file and grep functionality
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, desc = "Telescope find files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Telescope search word under cursor or selection" })

    vim.keymap.set("n", "<leader>lr", ":Telescope coc references<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>ss", ":Telescope coc document_symbols<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>sa", ":Telescope coc workspace_symbols<CR>", { silent = true, noremap = true })
  end
}
