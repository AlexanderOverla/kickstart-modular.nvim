return {
  {
    'mason-org/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
    opts = {
      PATH = 'prepend',
      ui = {
        icons = {
          package_pending = ' ',
          package_installed = ' ',
          package_uninstalled = ' ',
        },
      },
      max_concurrent_installers = 10,
    },
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    lazy = false,
    opts = {
      ensure_installed = {
        -- NOTE: Use this section to install formatters and linters
        'prettierd',
        'prettier',
        'stylua',
        'eslint_d',
        'jsonlint',
        'csharpier',
      },
    },
  },
  {
    'mason-org/mason-lspconfig.nvim',
    lazy = false,
    opts = {
      ensure_installed = {
        -- NOTE: Use this section to install language servers
        'lua_ls',
        'ts_ls',
        'tailwindcss',
        'eslint',
        'roslyn_ls',
      },
    },
    automatic_enable = true,
  },
}
