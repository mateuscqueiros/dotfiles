return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "elixir",
      "heex",
      "javascript",
      "html",
      "ruby",
    },
    auto_install = true,
    modules = {},
    ignore_install = {},
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = {
      enable = true,
    },
  },
}
