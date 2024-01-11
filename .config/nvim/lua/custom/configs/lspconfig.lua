local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"
-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "cssmodules_ls",
  "eslint",
  "stylelint_lsp",
  "tailwindcss",
  "gopls",
  "gradle_ls",
  "graphql",
  "dockerls",
  "volar",
}

local on_attach_setup = function(client, bufnr, lsp)
  on_attach(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.formatting_seq_sync()
      end,
    })
  end

  if lsp == "gopls" then
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
        vim.lsp.buf.format { async = false }
      end,
    })
  end
end

local function get_typescript_server_path(root_dir)
  local global_ts = "/home/[yourusernamehere]/.npm/lib/node_modules/typescript/lib"
  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ""
  local function check_dir(path)
    found_ts = util.path.join(path, "node_modules", "typescript", "lib")
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

for _, lsp in ipairs(servers) do
  if lsp == "volar" then
    lspconfig[lsp].setup {
      on_attach = function(client, bufnr)
        on_attach_setup(client, bufnr, lsp)
      end,
      capabilities = capabilities,
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
      on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      end,
    }
  else
    lspconfig[lsp].setup {
      on_attach = function(client, bufnr)
        on_attach_setup(client, bufnr, lsp)
      end,
      capabilities = capabilities,
    }
  end
end

-- lspconfig.eslint.setup({
--   --- ...
--   on_attach = function(client, bufnr)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       command = "EslintFixAll",
--     })
--   end,
-- })

-- local protocol = require('vim.lsp.protocol')
--
-- local on_attach = function(client, bufnr)
--   -- format on save
--   if client.server_capabilities.documentFormattingProvider then
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = vim.api.nvim_create_augroup("Format", { clear = true }),
--       buffer = bufnr,
--       callback = function() vim.lsp.buf.formatting_seq_sync() end
--     })
--   end
-- end
--
-- -- TypeScript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" }
-- }
--

--
-- lspconfig.pyright.setup { blabla}
