return {
  { 'JoosepAlviste/nvim-ts-context-commentstring', opts = {} },
  {
    'numToStr/Comment.nvim',
    lazy = false,
    opts = {
      toggler = {
        line = '<leader>/',
        block = '<leader>cb',
      },
      pre_hook = function()
        require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      end,
    },
  },
}
