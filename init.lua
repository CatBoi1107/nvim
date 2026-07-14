-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'
-- Set <leader> to spacebar
vim.g.mapleader = " "

-- Number line and relative number line
vim.opt.number = true
vim.opt.relativenumber = true

require("config.lazy")
require("mappings")

-- Language Server Protocols
vim.lsp.config('jdtls', {
	filetypes = { 'java' }, 
	cmd = { '/usr/bin/jdtls'},
	root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },
	})

vim.lsp.enable('jdtls')
