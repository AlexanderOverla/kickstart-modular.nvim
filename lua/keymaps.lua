-- Keybinds For NeoVim --

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('t', '<Esc><Esc>', '<cmd>ToggleTerm<cr>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- File Searches
vim.keymap.set('n', '<leader>sf', function()
  require('fzf-lua').files()
end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', function()
  require('fzf-lua').buffers()
end, { desc = '[S]earch [B]uffers' })
-- Git Searches
vim.keymap.set('n', '<leader>sgf', function()
  require('fzf-lua').git_files()
end, { desc = '[S]earch [G]it [F]iles' })
vim.keymap.set('n', '<leader>sgb', function()
  require('fzf-lua').git_branches()
end, { desc = '[S]earch [G]it [B]ranches' })
vim.keymap.set('n', '<leader>sgc', function()
  require('fzf-lua').git_commits()
end, { desc = '[S]earch [G]it [C]ommits' })
-- Other Searches
vim.keymap.set('n', '<leader>sh', function()
  require('fzf-lua').help_tags()
end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function()
  require('fzf-lua').live_grep_native()
end, { desc = '[S]earch [W]ords' })
vim.keymap.set('n', '<leader>sc', function()
  require('fzf-lua').builtin()
end, { desc = '[S]earch builtin [C]ommands' })
vim.keymap.set('n', '<leader>st', '<cmd>TodoFzfLua keywords=TODO,todo,Todo<CR>', { desc = '[S]earch [T]odo comments' })

-- Open plugin UIs
vim.keymap.set('n', '<leader>om', '<cmd>Mason<CR>', { desc = '[O]pen [M]ason' })
vim.keymap.set('n', '<leader>ol', '<cmd>Lazy<CR>', { desc = '[O]pen [L]azy' })

-- ThePrimeagen's favorite keymaps
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

vim.keymap.set({ 'n', 'v' }, 'y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', 'Y', [["+Y]], { desc = 'Yank to system clipboard' })

-- Neotree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<cr>', { desc = '[E]xplore Files' })
vim.keymap.set('n', '<leader>r', ':Neotree reveal<cr>', { desc = '[R]eveal Files' })
vim.keymap.set('n', '<leader>tb', ':Neotree toggle show buffers<cr>', { desc = '[T]oggle [B]uffers' })

vim.keymap.set('n', '<leader>q', ':q<cr>', { desc = '[Q]uit' })
vim.keymap.set('n', '<leader>w', ':w<cr>', { desc = '[W]rite' })

vim.keymap.set({ 'n', 'v' }, '<leader>/', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = '[C]omment Line' })

vim.keymap.set({ 'n', 'v' }, '<leader>cl', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = '[C]omment [L]ine' })

vim.keymap.set({ 'n', 'v' }, '<leader>cb', function()
  require('Comment.api').toggle.blockwise.current()
end, { desc = '[C]omment [B]lock' })

vim.keymap.set({ 'n', 't' }, '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = '[T]oggle [T]erminal' })
vim.keymap.set({ 'n', 't' }, '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = '[T]oggle [T]erminal' })
vim.keymap.set({ 'n', 't' }, '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = '[T]oggle [T]erminal' })

vim.keymap.set('n', '<leader>l', function()
  require('lint').try_lint()
end, { desc = '[L]int File' })
