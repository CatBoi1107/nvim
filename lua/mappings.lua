-- add yours here

local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('n', '<leader>rc', ':RunCode<CR>', { desc = 'Run Current Code' })
vim.keymap.set('n', '<S-Enter>', ':MoltenEvaluateOperator<CR>', { silent = true })
vim.keymap.set('v', '<S-Enter>', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true })
vim.keymap.set('n', '<leader>mi', ':MoltenInit<CR>', { desc = 'Initialize Molten' })
vim.keymap.set('n', '<leader>mc', ':MoltenHideOutput<CR>', { desc = 'Hide Output' })
vim.keymap.set('n', '<leader>mrc', ':MoltenReevaluateCell<CR>', { desc = 'Evaluate Cell' })
vim.keymap.set('n', '<leader>mrl', ':MoltenEvaluateLine<CR>', { desc = 'Evaluate Line' })
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle Nvim-Tree' })

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<CR>', { desc = 'Telescope recent files' })

vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ft', function()
  local dir = vim.fn.expand '%:p:h'
  require('toggleterm.terminal').Terminal:new({ dir = dir, hidden = true }):toggle()
end, { desc = "Terminal in current file's dir" })
