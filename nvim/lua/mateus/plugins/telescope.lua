return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "^node_modules/",
        ".stylua.toml",
        "package-lock.json",
        "yarn.lock",
        "^lazy-lock.json",
      },
    },
  },
  tag = "0.1.5",
  dependencies = {
    "junegunn/fzf",
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
  },
}
