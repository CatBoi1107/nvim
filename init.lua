-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'
-- Set <leader> to spacebar
vim.g.mapleader = " "

require("config.lazy")
require("mappings")
