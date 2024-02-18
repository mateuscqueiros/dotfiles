return {
  {
    "junegunn/fzf",
  },
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "^node_modules/",
        ".stylua.toml",
        "package-lock.json",
        "yarn.lock",
        "lazy-lock.json",
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
  },
}
