local lisp_dialects = { "clojure", "fennel" }

return {
  {
    "Olical/conjure",
    ft = lisp_dialects,
    init = function()
      vim.g["conjure#log#hud#enabled"] = false
      vim.g["conjure#highlight#enabled"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
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
