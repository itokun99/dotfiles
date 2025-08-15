require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls"  }

local servers = {
  html = {},
  cssls = {},
  awk_ls = {},
  bashls = {},
  vtsls = {},
  tsserver = {},
  ts_ls = {},
  gopls = {},
  golangci_lint_ls = {},
  cssmodules_ls = {},
  graphql = {},
  docker_language_server = {},
  fish_lsp = {},
  jsonls = {},
  sqls = {},
  tailwindcss = {},
  yamlls = {},
  kotlin_language_server = {},
  kotlin_lsp = {},
  jdtls = {},
  lua_ls = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

-- vim.lsp.enable(servers)

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end

-- read :h vim.lsp.config for changing options of lsp servers
