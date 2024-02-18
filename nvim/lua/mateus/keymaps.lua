local telescope_builtin = require("telescope.builtin")

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local keymap = vim.keymap
local buf = vim.lsp.buf

keymap.set("t", "<Esc>", "<C-\\><C-n>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<leader>h", ":nohlsearch<CR>")
keymap.set("n", "J", "mzJ`z")

keymap.set("x", "<leader>p", [["+p]])
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<leader>o", "o<Esc>")
keymap.set("n", "<leader>O", "O<Esc>")

keymap.set("n", "<A-v>", "<C-v>")

-- Telescope
keymap.set("n", "<leader>ff", telescope_builtin.fd)
keymap.set("n", "<leader>fg", telescope_builtin.live_grep)
keymap.set("n", "<leader>fb", telescope_builtin.buffers)
keymap.set("n", "<leader>fh", telescope_builtin.help_tags)

-- Harpoon
keymap.set("n", "<leader>A", mark.add_file)
keymap.set("n", "<leader>a", ui.toggle_quick_menu)
keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
keymap.set("n", "<leader>4", function() ui.nav_file(4) end)

keymap.set("n", "<leader>t1", function() ui.nav_file(4) end)

-- Neo tree
keymap.set("n", "<C-b>", "<cmd>Neotree reveal<CR>")
keymap.set("n", "<leader>b", "<cmd>Neotree toggle show buffers right<cr>")
keymap.set("n", "<leader>gs", "<cmd>Neotree float git_status<cr>")

-- LSP Config
local on_attach = function()
  keymap.set("n", "<leader>rn", buf.rename, {})
  keymap.set("n", "<leader>ca", buf.code_action, {})

  keymap.set("n", "gd", buf.definition, {})
  keymap.set("n", "gi", buf.implementation, {})
  keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
  keymap.set("n", "K", buf.hover, {})
end

local cmp_mapping = function(cmp)
  return {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-s>"] = cmp.mapping.open_docs(),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-o>"] = cmp.mapping.complete(),
    ["<C-i>"] = cmp.mapping.complete(),
    ["<C-v>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  }
end

local exported = {
  on_attach = on_attach,
  cmp_mapping = cmp_mapping,
}

return exported
