-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'
-- Set <leader> to spacebar
vim.g.mapleader = " "

-- Number line and relative number line
vim.opt.number = true
vim.opt.relativenumber = true

require("config.lazy")
require("mappings")
