return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local colors = require("solarized-osaka.colors")
    local TelescopeColor = {
      TelescopeSelection = {
        fg = colors.default.yellow500,
        bold = true,
      },
      TelescopeBorder = {
        bg = colors.default.yellow500,
        fg = colors.default.yellow500,
      },
    }

    for hl, col in pairs(TelescopeColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end
  end,
}
