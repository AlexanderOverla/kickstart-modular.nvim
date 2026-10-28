-- Keybinds For NeoVim --

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- vim.keymap.set('t', '<Esc><Esc>', '<cmd>ToggleTerm<cr>', { desc = 'Exit terminal mode' })
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


-- Open plugin UIs
vim.keymap.set('n', '<leader>om', '<cmd>Mason<CR>', { desc = '[O]pen [M]ason' })
-- Using vim.pack instead of lazy so no longer need this.
-- Would be nice to have a vim.pack UI similar to Lazy for managing plugins
-- vim.keymap.set('n', '<leader>ol', '<cmd>Lazy<CR>', { desc = '[O]pen [L]azy' })

-- ThePrimeagen's favorite keymaps
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- Don't think these are needed because of the vim.o.clipboard setting
-- vim.keymap.set({ 'n', 'v' }, 'y', [["+y]], { desc = 'Yank to system clipboard' })
-- vim.keymap.set('n', 'Y', [["+Y]], { desc = 'Yank to system clipboard' })


vim.keymap.set('n', '<leader>q', ':q<cr>', { desc = '[Q]uit' })
vim.keymap.set('n', '<leader>Q', '<cmd>q!<cr>', { desc = '[Q]quit Force' })
vim.keymap.set('n', '<leader>w', ':w<cr>', { desc = '[W]rite' })

vim.keymap.set('n', '<leader>l', function()
  require('lint').try_lint()
end, { desc = '[L]int File' })

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})