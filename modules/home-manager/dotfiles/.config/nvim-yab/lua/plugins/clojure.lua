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
    "julienvincent/nvim-paredit",
    config = function()
      local paredit = require("nvim-paredit")
      paredit.setup(
        -- {
        --   keys = {
        --     ["?"] = { paredit.api.slurp_forwards, "Slurp forwards" },
        --     ["?"] = { paredit.api.barf_backwards, "Barf backwards" },
        --     ["?"] = { paredit.api.barf_forwards, "Barf forwards" },
        --     ["?"] = { paredit.api.slurp_backwards, "Slurp backwards" },
        --   },
        -- }
      )
    end
  },
  -- {
  --   "dundalek/parpar.nvim",
  --   ft = lisp_dialects,
  --   dependencies = {
  --     {
  --       "gpanders/nvim-parinfer",
  --       ft = { "clojure" },
  --       config = function()
  --         vim.g.parinfer_force_balance = true
  --       end,
  --     },
  --     { "julienvincent/nvim-paredit" } },
  --   config = function()
  --     local paredit = require "nvim-paredit"
  --     require("parpar").setup {
  --       paredit = {
  --         keys = {
  --           ["<A-H>"] = { paredit.api.slurp_backwards, "Slurp backwards" },
  --           ["<A-J>"] = { paredit.api.barf_backwards, "Barf backwards" },
  --           ["<A-K>"] = { paredit.api.barf_forwards, "Barf forwards" },
  --           ["<A-L>"] = { paredit.api.slurp_forwards, "Slurp forwards" },
  --         },
  --       },
  --     }
  --   end,
  -- },
  { 'HiPhish/rainbow-delimiters.nvim' }
}
