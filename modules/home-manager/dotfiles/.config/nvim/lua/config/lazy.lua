-- Bootstrap lazy.nvim

-- define lazy.nvim install path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" 
-- check if lazy.nvim is installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- clone lazy.nvim if missing
  local lazyrepo = "https://github.com/folke/lazy.nvim.git" 
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }) 
  -- handle Git clone errors
  if vim.v.shell_error ~= 0 then 
    vim.api.nvim_echo({ 
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar() 
    os.exit(1) -- exit Neovim if cloning fails
  end
end
-- add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath) 

-- Setup lazy.nvim

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
