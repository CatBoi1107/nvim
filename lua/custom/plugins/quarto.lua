return {
  {
    'quarto-dev/quarto-nvim',
    dependencies = { 'jmbuhr/otter.nvim' },
    lazy = false,
    config = function()
      require('quarto').setup {
        opts = {
          lspFeatures = {
            languages = { 'python' },
            chunks = 'all',
          },
          keymap = {
            hover = 'K',
            definition = 'gd',
            rename = '<leader>rn',
          },
        },
      }
    end,
  },
}
