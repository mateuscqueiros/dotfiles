local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "Organize Imports",
  }
  if
    vim.bo.filetype == "ts"
    and vim.bo.filetype == "js"
    and vim.bo.filetype == "jsx"
    and vim.bo.filetype == "tsx"
  then
    vim.lsp.buf.execute_command(params)
  end
end

local no_preview = function()
  return require("telescope.themes").get_dropdown({
    borderchars = {
      { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    width = 0.8,
    previewer = false,
    prompt_title = false,
  })
end

return {
  organize_imports = organize_imports,
  no_preview = no_preview,
}
