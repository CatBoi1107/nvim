return {
  {
    'nvim-java/nvim-java',
    enabled = false,
    -- ft = 'java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function() require('java').setup() end,
  },
}
