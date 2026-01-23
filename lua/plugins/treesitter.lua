return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate | TSInstallAll",
  opts = {
      ensure_installed = {
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        "printf",
        "javascript",
        "typescript",
        "jsx",
        "tsx",
        "python",
        "markdown",
        "dockerfile",
      }
    }
}
