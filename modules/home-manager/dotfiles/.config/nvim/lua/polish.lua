-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

vim.opt.spell = false

vim.diagnostic.enable(false)

vim.keymap.set(
  "n",
  "<leader>ld",
  function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,
  { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>sS", function()
  local current = vim.opt.laststatus:get()
  vim.opt.laststatus = (current == 0) and 2 or 0
end, { silent = true, noremap = true })
