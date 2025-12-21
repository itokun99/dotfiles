-- ~/.config/nvim/lua/plugins/formatter.lua

return {
  -- [1] Konfigurasi conform.nvim untuk formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Untuk file web, coba 'prettierd' dulu, jika gagal baru pakai 'prettier'
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        -- vue = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },

        java = { "google-java-format" },

        -- Formatter lain (tidak berubah)
        lua = { "stylua" },
        go = { "gofmt", "goimports" },
        -- xml = { "xmlformatter" },
        xml = { "xmlformat" },
        -- python = { "isort", "black" },
      },
      formatters = {
        xmlformat = {
          -- Kustomisasi argumen agar cocok untuk Android
          -- Standar Android menggunakan 4 spasi untuk indentasi
          prepend_args = {
            "--indent",
            "4",
            "--selfclose", -- Pastikan tag kosong ditutup dengan />
            "--blanks", -- Pertahankan baris kosong yang Anda buat manual
          },
        },
      },
    },
  },

  -- [2] Konfigurasi nvim-lint untuk linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Gunakan eslint_d untuk file web
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },

        -- Linter lain (tidak berubah)
        python = { "flake8" },
        sh = { "shellcheck" },
      },
    },
  },

  -- [3] Pastikan none-ls dinonaktifkan untuk menghindari konflik
  { "nvimtools/none-ls.nvim", enabled = false },
}
