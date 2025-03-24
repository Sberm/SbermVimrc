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
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      -- switch on neotree when opening a directory
      init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree").setup({
            filesystem = {
              hijack_netrw_behavior = "open_current",
            },
          })
        end
      end
      end,
    },
    { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },
    { 'junegunn/vim-easy-align' },
    { 'sberm/vim-lucius' },
    { 'MattesGroeger/vim-bookmarks' },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'numToStr/Comment.nvim' },
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "default" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "markdown", "rust" , "cpp", "go", "python" },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-L>",
      node_incremental = "<C-L>",
      scope_incremental = false,
      node_decremental = false,
    },
  },
}

-- Comment.nvim setup
require('Comment').setup()

-- source my old vimrc file
vim.cmd('source ~/.vimrc')
