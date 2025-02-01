local function is_visible(cmp) return cmp.core.view:visible() or vim.fn.pumvisible() == 1 end

return {
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
}
