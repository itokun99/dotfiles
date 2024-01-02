local null_ls = require "null-ls"
local prettier = require "prettier"

local b = null_ls.builtins

---------------------------------
-- Formatting
---------------------------------

local augroup = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })

local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with {
  --   filetypes = {
  --     "html",
  --     "markdown",
  --     "css",
  --     "javascript",
  --     "typescript",
  --     "javascriptreact",
  --     "typescriptreact",
  --     "json",
  --     "scss",
  --     "less",
  --   },
  -- }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,
  -- b.diagnostics.eslint.with({
  --   diagnostics_format = '[eslint] #{m}\n(#{c})'
  -- }),
  -- b.formatting.eslint,
  -- b.diagnostics.eslint,
  -- b.code_actions.eslint_d,
  -- b.formatting.stylelint,
  -- b.diagnostics.stylelint,

  b.formatting.gofumpt,
  b.formatting.goimports,
  b.diagnostics.golangci_lint,

  -- cpp
  -- b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd(event, {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, async = async }
        end,
      })
    end
  end,
}

prettier.setup {
  bin = "prettierd",
  filetypes = {
    "html",
    "markdown",
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less",
    "graphql",
    "yaml",
  },
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists {
        -- if `false`, skips checking `package.json` for `"prettier"` key
        check_package_json = true,
      }
    end,
    runtime_condition = function(params)
      -- return false to skip running prettier
      return true
    end,
    timeout = 5000,
  },
}
