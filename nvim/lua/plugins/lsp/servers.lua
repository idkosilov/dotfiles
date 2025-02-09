local M = {}

M.servers = {
  lua_ls = {
    -- cmd = {...},
    -- filetypes { ...},
    -- capabilities = {},
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          -- Tells lua_ls where to find all the Lua files that you have loaded
          -- for your neovim configuration.
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_get_runtime_file('', true)),
          },
          -- If lua_ls is really slow on your computer, you can try this instead:
          -- library = { vim.env.VIMRUNTIME },
        },
        completion = {
          callSnippet = 'Replace',
        },
        telemetry = { enable = false },
        diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  dockerls = {},
  docker_compose_language_service = {},
  basedpyright = {
    settings = {
      basedpyright = {
        disableOrganizeImports = true,
        disableLanguageServices = false,
        analysis = {
          ignore = { '*' },
          -- typeCheckingMode = 'off',
          diagnosticMode = 'openFilesOnly',
          useLibraryCodeForTypes = true,
          autoImportCompletions = true,
        },
      },
    },
  },
  ruff = {
    commands = {
      RuffAutofix = {
        function()
          vim.lsp.buf.execute_command {
            command = 'ruff.applyAutofix',
            arguments = { { uri = vim.uri_from_bufnr(0) } },
          }
        end,
        description = 'Ruff: Fix all auto-fixable problems',
      },
      RuffOrganizeImports = {
        function()
          vim.lsp.buf.execute_command {
            command = 'ruff.applyOrganizeImports',
            arguments = { { uri = vim.uri_from_bufnr(0) } },
          }
        end,
        description = 'Ruff: Format imports',
      },
    },
  },
  rust_analyzer = {
    ['rust-analyzer'] = {
      cargo = { features = 'all' },
      checkOnSave = true,
      check = { command = 'clippy' },
    },
  },
  yamlls = {},
  bashls = {},
}

return M
