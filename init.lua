-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },
    { 'junegunn/vim-easy-align' },
    { 'sberm/vim-lucius' },
    { 'MattesGroeger/vim-bookmarks' },
    { 'numToStr/Comment.nvim' },
    { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" }
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "default" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})

-- Comment.nvim setup
require('Comment').setup()

-- source my old vimrc file
vim.cmd('source ~/.vimrc')

-- snippets
require("luasnip.loaders.from_snipmate").load()
