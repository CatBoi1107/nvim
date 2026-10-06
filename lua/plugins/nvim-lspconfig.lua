return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- Broadcast nvim-cmp completion capabilities to the servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    mason_lspconfig.setup({
      -- Automatically download binaries for servers you use
      ensure_installed = {
        "basedpyright",
        "clangd",
        "jdtls",
        "ruff",
        "sqls",
        "lua_ls",
      },
      handlers = {
        -- Default setup for all installed servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- Specific fix for clangd filetypes warning
        ["clangd"] = function()
          lspconfig.clangd.setup({
            capabilities = capabilities,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          })
        end,

        -- Server-specific settings for Lua
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      },
    })
  end,
}
