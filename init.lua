local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- leader must be set before lazy loads
require("core.options")
require("core.gui")

require("lazy").setup({
  { import = "plugins" },
}, {
  ui = {
    icons = {
      cmd = "[cmd]", config = "[cfg]", event = "[evt]", ft = "[ft]",
      init = "[init]", import = "[imp]", keys = "[keys]", lazy = "[lazy] ",
      loaded = "*", not_loaded = "o", plugin = "[p]", runtime = "[rt]",
      require = "[req]", source = "[src]", start = "[start]", task = "[t]",
      list = { "-", "*", "x", "!" },
    },
  },
})

require("core.keymaps")
require("core.autocmds")
require("core.providers")
