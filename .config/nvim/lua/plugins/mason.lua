-- ~/.config/nvim/lua/plugins/mason.lua
return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- Tambahkan atau pastikan baris ini ada
      "prettierd",
      "eslint_d",

      -- Linter & formatter lain yang Anda gunakan
      "stylua",
      -- "gofmt",
      "goimports",
      "shellcheck",
    },
  },
}
