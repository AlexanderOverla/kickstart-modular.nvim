vim.g.mapleader = ' '
vim.g.have_nerd_font = true

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
  local repo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', repo, '--branch=stable', lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require 'configs.lazy'

require('lazy').setup({
  require 'plugins.fzf-lua',
  require 'plugins.which-key',
  require 'plugins.mini',
  require 'plugins.lualine',
  require 'plugins.todo-comments',
  require 'plugins.highlight-colors',
  require 'plugins.conform',
  require 'plugins.blink-cmp',
  require 'plugins.treesitter',
  require 'plugins.onedark',
  require 'plugins.lsp',
  require 'plugins.neo-tree',
  require 'plugins.comment',
  require 'plugins.toggleterm',
  require 'plugins.lint',
  require 'plugins.gitsigns',
}, lazy_config)

require 'options'
require 'autocmds'
require 'configs.lsp'

vim.schedule(function()
  require 'keymaps'
end)
