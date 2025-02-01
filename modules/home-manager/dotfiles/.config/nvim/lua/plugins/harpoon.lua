return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
   local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>s", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-a>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-u>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-i>", function() harpoon:list():select(2) end)
  end,
}
