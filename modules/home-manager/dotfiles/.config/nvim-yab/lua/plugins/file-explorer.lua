return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set("n", "<leader>ee", function()
      vim.cmd("Neotree source=filesystem reveal=true position=left toggle=true")
    end, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ef", function()
      vim.cmd("Neotree source=filesystem reveal=true position=current toggle=true")
    end, { noremap = true, silent = true })
  end
}
