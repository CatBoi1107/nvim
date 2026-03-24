vim.g.loaded_tree_sitter = nil
vim.opt.runtimepath:prepend(vim.fn.stdpath 'data' .. '/treesitter')

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parser_install_dir = vim.fn.stdpath 'data' .. '/treesitter',
      ensure_installed = { 'markdown', 'markdown_inline', 'python', 'json' },
    },
  },
}
