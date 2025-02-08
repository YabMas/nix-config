return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- Some servers have issues with backup files
      vim.opt.backup = false
      vim.opt.writebackup = false

      -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable delays
      vim.opt.updatetime = 300

      -- Always show the signcolumn, otherwise it would shift the text
      vim.opt.signcolumn = "yes"

      -- Set up key mappings
      local keymap_opts = { silent = true, noremap = true }
      local expr_opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

      -- Use Ctrl-j/k for navigating completion menu only when it's visible
      vim.keymap.set("i", "<C-j>",
        'coc#pum#visible() ? coc#pum#next(1) : "<C-j>"',
        expr_opts
      )
      vim.keymap.set("i", "<C-k>",
        'coc#pum#visible() ? coc#pum#prev(1) : "<C-k>"',
        expr_opts
      )

      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      vim.keymap.set("i", "<cr>",
        [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
        expr_opts
      )

      -- GoTo code navigation
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)", keymap_opts)
--      vim.keymap.set("n", "gr", "<Plug>(coc-references)", keymap_opts)

      -- Use K to show documentation in preview window
      function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end

      vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', keymap_opts)

      -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
      vim.api.nvim_create_augroup("CocGroup", {})
      vim.api.nvim_create_autocmd("CursorHold", {
        group = "CocGroup",
        command = "silent call CocActionAsync('highlight')",
        desc = "Highlight symbol under cursor on CursorHold"
      })

      -- Symbol renaming
      vim.keymap.set("n", "<leader>lR", "<Plug>(coc-rename)", keymap_opts)

      -- Formatting selected code
      vim.keymap.set("x", "<leader>lf", "<Plug>(coc-format-selected)", keymap_opts)
      vim.keymap.set("n", "<leader>lf", "<Plug>(coc-format-selected)", keymap_opts)
    end,
  }
}
