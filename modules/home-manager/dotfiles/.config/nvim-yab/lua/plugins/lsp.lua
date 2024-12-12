local function is_visible(cmp) return cmp.core.view:visible() or vim.fn.pumvisible() == 1 end

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
  vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
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
    'hrsh7th/nvim-cmp',
    config = function()
      -- add cmp_nvim_lsp capabilities
      local lspconfig_defaults = require("lspconfig").util.default_config

      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lspconfig_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )


      local cmp = require('cmp')

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        snippet = {
          expand = function(args) vim.snippet.expand(args.body) end,
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ["<C-j>"] = cmp.mapping(function()
            if is_visible(cmp) then
              cmp.select_next_item()
            else
              cmp.complete()
            end
          end),
          ["<C-k>"] = cmp.mapping(function()
            if is_visible(cmp) then
              cmp.select_prev_item()
            else
              cmp.complete()
            end
          end),
        },
      })
    end
  },
  { 'hrsh7th/cmp-nvim-lsp' },
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
