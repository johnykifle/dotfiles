vim.lsp.set_log_level 'error'

require('vim.lsp.log').set_format_func(vim.inspect)

local nvim_lsp = require 'lspconfig'

local on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)


  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

end


-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp['elmls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
      elmLS = {
        elmFormatPath = "elm-format";
        elmPath = "elm";
        elmReviewPath = "elm-review";
        elmTestPath = "elm-test";
      }
    }
}

nvim_lsp['tsserver'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

