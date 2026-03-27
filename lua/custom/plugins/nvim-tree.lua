return {
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'
        local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

        -- keep all default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- your overrides
        vim.keymap.set('n', 'l', api.node.open.edit, opts)
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts)
        vim.keymap.set('n', 'L', api.tree.change_root_to_node, opts)
        vim.keymap.set('n', 'H', api.tree.change_root_to_parent, opts)
      end,

      git = {
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
    },
  },
}
