local jdtls = require('jdtls')

-- Root detection: git is enough, no gradle/maven needed
local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == '' then
  return
end

-- Each project gets its own persistent workspace/index dir
-- This is the missing piece that made cross-file resolution fail before
local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspace/' .. project_name

local config = {
  cmd = { '/usr/bin/jdtls', '-data', workspace_dir },
  root_dir = root_dir,

  settings = {
    java = {
      project = {
        sourcePaths = { '.', 'test' },
        outputPath = 'bin',
        referencedLibraries = {
          root_dir .. '/lib/**/*.jar',
        },
      },
    },
  },

  capabilities = require('cmp_nvim_lsp').default_capabilities(), -- remove this line if you don't use nvim-cmp
}

jdtls.start_or_attach(config)
