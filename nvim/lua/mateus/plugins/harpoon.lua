return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local telescope = require("telescope")

    harpoon:setup({})

    telescope.load_extension("harpoon")

    -- Harpoon
    vim.keymap.set("n", "<leader>A", function() harpoon:list():append() end)
    vim.keymap.set(
      "n",
      "<leader>a",
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
    )

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
  end,
}
