return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer' }),
      vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' }),
      vim.keymap.set('n', '<leader>x', function()
        local bufs = vim.fn.getbufinfo { buflisted = 1 }
        local cur = vim.api.nvim_get_current_buf()
        -- find another buffer to switch to
        for _, buf in ipairs(bufs) do
          if buf.bufnr ~= cur then
            vim.api.nvim_set_current_buf(buf.bufnr)
            break
          end
        end
        vim.cmd('bd ' .. cur)
      end, { desc = 'Close buffer' }),
    },
  },
}
