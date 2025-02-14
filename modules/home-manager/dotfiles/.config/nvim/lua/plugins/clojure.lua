local lisp_dialects = { "clojure", "fennel" }

return {
  {
    "Olical/conjure",
    ft = lisp_dialects,
    init = function()
      vim.g["conjure#log#hud#enabled"] = false
      vim.g["conjure#highlight#enabled"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
      vim.keymap.set('i', '"', '""<left>', { noremap = true })
    end,
    config = function()
      vim.keymap.set('n', '<localleader>rr', function()
        vim.cmd([[ConjureEval (development/restart)]])
      end, { desc = 'Call development/restart' })

      vim.keymap.set('n', '<localleader>1', function()
        vim.cmd([[ConjureConnect 7888]])
      end, { desc = 'Switch to Clojure REPL' })

      vim.keymap.set('n', '<localleader>2', function()
        vim.cmd([[ConjureConnect 9000]])
      end, { desc = 'Switch to ClojureScript REPL' })

      vim.keymap.set('n', '<localleader>\\', function()
        vim.cmd([[ConjureLogSplit]])
      end, { desc = 'Open REPL in horizontal split' })

      vim.keymap.set('n', '<localleader>|', function()
        vim.cmd([[ConjureLogVSplit]])
      end, { desc = 'Open REPL in vertical split' })
    end
  },
  {
    "gpanders/nvim-parinfer",
    ft = { lisp_dialects },
    config = function()
      vim.g.parinfer_force_balance = true
    end,
  },
  { 'HiPhish/rainbow-delimiters.nvim' }
}
