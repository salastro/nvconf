local on_attach = function(client, bufnr)
  require("plugins.configs.lspconfig").on_attach(client, bufnr)

  local augroup_id = vim.api.nvim_create_augroup("FormatModificationsDocumentFormattingGroup", { clear = false })
  vim.api.nvim_clear_autocmds { group = augroup_id, buffer = bufnr }

  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup_id,
    buffer = bufnr,
    callback = function()
      local lsp_format_modifications = require "lsp-format-modifications"
      lsp_format_modifications.format_modifications(client, bufnr)
    end,
  })
end
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "pyright", "texlab", "bashls", "zls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Verible
lspconfig.verible.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

-- Clangd
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
