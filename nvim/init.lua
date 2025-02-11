require 'core.keymaps'
require 'core.options'
require 'core.snippets'

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup({
    require 'plugins.neo-tree',
    require 'plugins.lazygit',
    require 'plugins.comment',
    require 'plugins.misc',
    require 'plugins.telescope',
    require 'plugins.treesitter',
    require 'plugins.lualine',
    require 'plugins.gitsigns',
    require 'plugins.theme',
    require 'plugins.autocompletions',
    require 'plugins.lsp.init',
    require 'plugins.indent-blankline',
    require 'plugins.debug',
    require 'plugins.alpha',
    require 'plugins.leetcode',
    'ThePrimeagen/vim-be-good',
})
