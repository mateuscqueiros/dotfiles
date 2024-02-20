return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function() require("mini.starter").setup() end,
  },
}
