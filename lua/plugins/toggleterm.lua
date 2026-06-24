return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 20,
        open_mapping = [[<c-\>]],
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
      }

      -- Double-esc to enter normal mode in terminal
      vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { noremap = true, silent = true })
    end,
  },
}
