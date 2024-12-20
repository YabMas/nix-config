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
  -- {
  --   "julienvincent/nvim-paredit",
  --   config = function()
  --     local paredit = require("nvim-paredit")
  --     paredit.setup(
  --       {
  --         -- keys = {
  --         --   ["<M-H"] = { paredit.api.slurp_forwards, "Slurp forwards" },
  --         --   ["<M-J"] = { paredit.api.barf_backwards, "Barf backwards" },
  --         --   ["<M-K"] = { paredit.api.barf_forwards, "Barf forwards" },
  --         --   ["<M-L"] = { paredit.api.slurp_backwards, "Slurp backwards" },
  --         -- },
  --       }
  --     )
  --   end
  -- },
  {
    "dundalek/parpar.nvim",
    ft = lisp_dialects,
    dependencies = {
      {
        "gpanders/nvim-parinfer",
        ft = { "clojure" },
        config = function()
          vim.g.parinfer_force_balance = true
        end,
      },
      { "julienvincent/nvim-paredit" } },
    config = function()
      local paredit = require "nvim-paredit"
      require("parpar").setup { }
    end,
  },
  { 'HiPhish/rainbow-delimiters.nvim' }
}
