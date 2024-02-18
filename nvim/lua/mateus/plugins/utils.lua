return {
  {
    "tpope/vim-surround",
    "j-hui/fidget.nvim",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = {
            spacing = 5,
            severity_limit = "Warning",
          },
          update_in_insert = true,
        })

      require("nvim-ts-autotag").setup()
    end,
  },
}
