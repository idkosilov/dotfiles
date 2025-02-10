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
  basedpyright = {
    -- Config options: https://github.com/DetachHead/basedpyright/blob/main/docs/settings.md
    settings = {
      basedpyright = {
        disableOrganizeImports = true, -- Using Ruff's import organizer
        disableLanguageServices = false,
        analysis = {
          ignore = { '*' },                 -- Ignore all files for analysis to exclusively use Ruff for linting
          typeCheckingMode = 'standard',
          diagnosticMode = 'openFilesOnly', -- Only analyze open files
          autoImportCompletions = true,     -- whether pyright offers auto-import completions
          inlayHints = {
            callArgumentNames = true
          }
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
