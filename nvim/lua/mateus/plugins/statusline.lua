return {
  -- { "vimpostor/vim-tpipeline" },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
        globalstatus = true,
        -- component_separators = "",
        -- section_separators = "",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
