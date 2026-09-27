local map = vim.keymap.set

map('n', '<leader>rr', ':restart<CR>', { desc = 'Restart Neovim' })

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')

map('n', '<leader>ft', function()
  local dir = vim.fn.expand '%:p:h'
  require('toggleterm.terminal').Terminal:new({ dir = dir, hidden = true }):toggle()
end, { desc = "Terminal in current file's dir" })

map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>tt', ':Themery<CR>', { desc = 'Switch themes' })

map('n', '<leader>rc', ':RunCode<CR>', { desc = 'Run Current Code' })

local builtin = require 'telescope.builtin'
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
map('n', '<leader>fo', ':Telescope oldfiles<CR>', { desc = 'Telescope recent files' })
map('n', '<leader>fn', function()
  builtin.find_files({ cwd = vim.fn.expand('~/.config/nvim'), hidden = true })
end, { desc = 'Telescope nvim config' })
map('n', '<leader>fc', function()
  builtin.live_grep({ cwd = vim.fn.expand('~/.config/nvim') })
end, { desc = 'Grep nvim config' })

map('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Toggle Neotree" })

-- This runs on LSP attach per buffer (see main LSP attach function in 'neovim/nvim-lspconfig' config for more info,
-- it is better explained there). This allows easily switching between pickers if you prefer using something else!
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf

    -- Telescope LSP pickers
    vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })
    vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })
    vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })
    vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })
    vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })
    vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })

    -- Standard LSP built-ins
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = buf, desc = 'Goto Definition' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = buf, desc = 'Code Action' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = buf, desc = 'Rename Symbol' })
  end,
})

-- Filetype-based keymapping (use :set ft?)
-- Typst:
vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
  pattern = 'typst',
  callback = function()
    vim.keymap.set('n', '<leader>rc', ':TypstPreview<CR>', { desc = 'Show Live Preview', buffer = true })
    vim.keymap.set('n', '<leader>sf', ':RunCode<CR>', { desc = 'Save as PDF', buffer = true })
  end,
})

-- markdown
vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
  pattern = 'markdown',
  callback = function()
    vim.keymap.set('n', '<leader>rc', ':LivePreview start<CR>', { desc = 'Show Live Preview', buffer = true })
  end,
})
