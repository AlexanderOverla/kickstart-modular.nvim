-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

-- Keymaps for Neo-tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<cr>', { desc = '[E]xplore Files' })
vim.keymap.set('n', '<leader>r', ':Neotree reveal<cr>', { desc = '[R]eveal Files' })
-- Using telescope instead of neotree to see buffers
-- vim.keymap.set('n', '<leader>tb', ':Neotree toggle show buffers<cr>', { desc = '[T]oggle [B]uffers' })

require('neo-tree').setup {
  event_handlers = {
    {
      event = 'file_opened',
      handler = function() require('neo-tree.command').execute { action = 'close' } end,
    },
  },
  -- filesystem = {
  --   window = {
  --     mappings = {
  --       ['\\'] = 'close_window',
  --     },
  --   },
  -- },
}
