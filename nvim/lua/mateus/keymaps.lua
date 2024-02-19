local telescope_builtin = require("telescope.builtin")
local commands = require("mateus.commands")

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local keymap = vim.keymap
local buf = vim.lsp.buf

local opts = { noremap = true, silent = true }

-- Do things without changing register
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>p", '"0p')
keymap.set("n", "<leader>P", '"0P')
keymap.set("v", "<leader>p", '"0p')
keymap.set("n", "<leader>c", '"_c')
keymap.set("n", "<leader>C", '"_C')
keymap.set("v", "<leader>c", '"_c')
keymap.set("v", "<leader>C", '"_C')
keymap.set("n", "<leader>d", '"_d')
keymap.set("n", "<leader>D", '"_D')
keymap.set("v", "<leader>d", '"_d')
keymap.set("v", "<leader>D", '"_D')

-- Move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center when jumping
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Utils
keymap.set("n", "<leader>h", ":nohlsearch<CR>")
keymap.set("n", "J", "mzJ`z")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- New line
keymap.set("n", "<leader>o", "o<Esc>")
keymap.set("n", "<leader>O", "O<Esc>")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Telescope
keymap.set(
  "n",
  "<leader>ff",
  function() telescope_builtin.fd(commands.no_preview()) end
)
keymap.set(
  "n",
  "<leader>fg",
  function() telescope_builtin.live_grep(commands.no_preview()) end
)
keymap.set(
  "n",
  "<leader>fb",
  function() telescope_builtin.buffers(commands.no_preview()) end
)
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
keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>")
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
