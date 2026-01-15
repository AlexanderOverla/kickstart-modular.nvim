-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

--
-- FZF-Lua keymaps (aka Search) --
--
-- File Searches
vim.keymap.set('n', '<leader>sf', function() require('fzf-lua').files() end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', function() require('fzf-lua').buffers() end, { desc = '[S]earch [B]uffers' })
-- Git Searches
vim.keymap.set('n', '<leader>sgf', function() require('fzf-lua').git_files() end, { desc = '[S]earch [G]it [F]iles' })
vim.keymap.set('n', '<leader>sgb', function() require('fzf-lua').git_branches() end, { desc = '[S]earch [G]it [B]ranches' })
vim.keymap.set('n', '<leader>sgc', function() require('fzf-lua').git_commits() end, { desc = '[S]earch [G]it [C]ommits' })
-- Other Searches
vim.keymap.set('n', '<leader>sh', function() require('fzf-lua').help_tags() end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function() require('fzf-lua').live_grep_native() end, { desc = '[S]earch [W]ords' })
vim.keymap.set('n', '<leader>sc', function() require('fzf-lua').builtin() end, { desc = '[S]earch builtin [C]ommands' })
vim.keymap.set('n', '<leader>st', '<cmd>TodoFzfLua keywords=TODO,todo,Todo<CR>' , { desc = '[S]earch [T]odo comments' })

-- Open plugin UIs
vim.keymap.set('n', '<leader>om', '<cmd>Mason<CR>', { desc = '[O]pen [M]ason' })
vim.keymap.set('n', '<leader>ol', '<cmd>Lazy<CR>', { desc = '[O]pen [L]azy' })

-- ThePrimeagen's favorite keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

vim.keymap.set({ "n", "v" }, "y", [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set("n", "Y", [["+Y]], { desc = 'Yank to system clipboard' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
