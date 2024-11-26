-- source my old vimrc file
vim.cmd('source ~/.vimrc')

-- use block cursor
vim.o.guicursor = 'n-v-c-sm-i-ci-ve-r-cr-o:block'

-- rust analyzer
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

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
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    },
    { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },
    { 'junegunn/vim-easy-align' },
    { 'sberm/vim-lucius' },
    { 'MattesGroeger/vim-bookmarks' },
    { 'nvim-treesitter/nvim-treesitter' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})

-- after lucius plugin is loaded
vim.cmd('colorscheme lucius')

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "markdown", "rust" },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "≠", -- <M-=>
      node_incremental = "≠",
      scope_incremental = "±", -- <M-+>
      node_decremental = "–", -- <M-->
    },
  },
}
