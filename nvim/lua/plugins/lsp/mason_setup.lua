local servers_config = require('plugins.lsp.servers').servers

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

require('mason').setup()

local ensure_installed = vim.tbl_keys(servers_config)
table.insert(ensure_installed, 'stylua')

require('mason-tool-installer').setup {
  ensure_installed = ensure_installed,
}

require('mason-lspconfig').setup {
  handlers = {
    function(server_name)
      local opts = servers_config[server_name] or {}
      opts.capabilities = vim.tbl_deep_extend('force', {}, capabilities, opts.capabilities or {})
      require('lspconfig')[server_name].setup(opts)
    end,
  },
}
