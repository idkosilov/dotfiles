return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function ()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    require('mason-null-ls').setup {
      ensure_installed = {
        'stylua',
        'ruff',
      },
      automatic_installation = true,
    }

    local sources = {
      formatting.stylua,
      require('none-ls.formatting.ruff'),
      require('none-ls.formatting.ruff_format'),
      diagnostics.mypy.with({
        command = "mypy",
        extra_args = function(params)
          return { "--config-file", "pyproject.toml", "--ignore-missing-imports" }
        end,
        cwd = function(params)
          return vim.fn.getcwd()
        end,
      }),
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end
}
