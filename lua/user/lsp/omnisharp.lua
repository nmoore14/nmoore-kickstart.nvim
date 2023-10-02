local pid = vim.fn.getpid()
local omnisharp_bin = '~/.local/share/nvim/mason/packages/omnisharp'

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require'lspconfig'.omnisharp.setup {
  cmd = { omnisharp_bin, '--language-server', '--hostPID', tostring(pid) },
  on_attach = on_attach
}

