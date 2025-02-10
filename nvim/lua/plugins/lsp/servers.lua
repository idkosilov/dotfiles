local M = {}

M.servers = {
  lua_ls = {
    -- Configuration for the Lua language server.
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_get_runtime_file('', true)),
          },
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
  -- Configuration for pylsp with mypy support:
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          mccabe = { enabled = false },
          pylsp_mypy = { enabled = false },
          pylsp_black = { enabled = false },
          pylsp_isort = { enabled = false },
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
