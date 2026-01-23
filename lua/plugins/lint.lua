return {
  'mfussenegger/nvim-lint',
  lazy = false,
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linter_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      jsx = { 'eslint_d' },
      tsx = { 'eslint_d' },
    }
  end,
}
