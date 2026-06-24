local map = vim.keymap.set

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

  -- Find references for the word under your cursor.
  vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })

  -- Jump to the implementation of the word under your cursor.
  -- Useful when your language has ways of declaring types without an actual implementation.
  vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })

  -- Jump to the definition of the word under your cursor.
  -- This is where a variable was first declared, or where a function is defined, etc.
  -- To jump back, press <C-t>.
  vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })

  -- Fuzzy find all the symbols in your current document.
  -- Symbols are things like variables, functions, types, etc.
  vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })

  -- Fuzzy find all the symbols in your current workspace.
  -- Similar to document symbols, except searches over your entire project.
  vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })

  -- Jump to the type of the word under your cursor.
  -- Useful when you're not sure what type a variable is and you want to see
  -- the definition of its *type*, not where it was *defined*.
  vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })
end,
})
