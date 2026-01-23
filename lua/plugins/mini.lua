return {
  'echasnovski/mini.nvim',
  lazy = false,
  config = function()
    local icons = require 'mini.icons'
    icons.setup {}

    -- local statusline = require 'mini.statusline'
    -- statusline.setup { use_icons = vim.g.have_nerd_font }
    -- statusline.section_location = function()
    -- return '%2l:%-2v'
    -- end

    local pairs = require 'mini.pairs'
    pairs.setup {}

    local has_statusline = vim.o.laststatus > 0
    local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
    local win_config = {
      anchor = 'SE',
      col = vim.o.columns,
      row = vim.o.lines - pad,
    }
    local notifs = require 'mini.notify'
    notifs.setup { window = { config = win_config } }
    vim.notify = notifs.make_notify()
  end,
}
