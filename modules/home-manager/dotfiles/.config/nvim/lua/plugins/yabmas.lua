return {
  { "clojure-vim/vim-jack-in" },
  { "radenling/vim-dispatch-neovim" },
  { "mrjones2014/smart-splits.nvim", lazy = false },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
      highlight = {
        pattern = [[.*<ONZIN\s*:]],
      },
    },
  },
  {
    "dundalek/parpar.nvim",
    dependencies = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
    config = function()
      local paredit = require "nvim-paredit"
      require("parpar").setup {
        paredit = {
          -- pass any nvim-paredit options here
          keys = {
            -- custom bindings are automatically wrapped
            ["<A-H>"] = { paredit.api.slurp_backwards, "Slurp backwards" },
            ["<A-J>"] = { paredit.api.barf_backwards, "Barf backwards" },
            ["<A-K>"] = { paredit.api.barf_forwards, "Barf forwards" },
            ["<A-L>"] = { paredit.api.slurp_forwards, "Slurp forwards" },
          },
        },
      }
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts) opts.winbar = nil end,
  },
  {
    "junegunn/vim-easy-align",
    config = function()
      vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false, silent = true })
      vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = false, silent = true })
    end,
  },
  require("gitsigns").setup {
    signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
  },
}
