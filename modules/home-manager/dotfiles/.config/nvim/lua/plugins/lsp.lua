local function toggle_diagnostics()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.disable()
  else
    vim.diagnostic.enable()
  end
end

local function on_attach(event)
  local opts = { buffer = event.buf }

  -- Keybindings for LSP actions
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  vim.keymap.set("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  vim.keymap.set({ "n", "x" }, "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  vim.keymap.set("n", "<leader>ld", toggle_diagnostics)
end

return {
  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function() require("mason-lspconfig").setup() end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Reserve a space in the gutter to avoid layout shifts
      vim.opt.signcolumn = "yes"
      vim.diagnostic.disable()


      -- language servers
      require('lspconfig').lua_ls.setup({})
      require('lspconfig').clojure_lsp.setup({})

      -- initialize on attach
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = on_attach
      })
    end

  },
}
