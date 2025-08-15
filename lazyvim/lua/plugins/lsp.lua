-- ~/.config/nvim/lua/plugins/formatter.lua

return {
  -- [1] Konfigurasi none-ls untuk menyediakan formatter dan linter
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = opts.sources or {}
      -- Tambahkan sumber Anda di sini. Hapus tanda '--' untuk mengaktifkan.
      -- Pastikan perkakasnya sudah terinstal di sistem Anda!
      vim.list_extend(opts.sources, {
        -- Formatting
        null_ls.builtins.formatting.stylua, -- Untuk Lua
        null_ls.builtins.formatting.prettier, -- Untuk Web Dev (JS, TS, CSS, JSON)
        null_ls.builtins.formatting.black, -- Untuk Python
        null_ls.builtins.formatting.isort, -- Untuk Python (mengurutkan imports)
        null_ls.builtins.formatting.gofmt, -- Untuk Go
        null_ls.builtins.formatting.goimports, -- Untuk Go (mengatur imports)
        null_ls.builtins.formatting.rustfmt, -- Untuk Rust
        null_ls.builtins.formatting.shfmt, -- Untuk Shell scripts

        -- Diagnostics (Linting)
        null_ls.builtins.diagnostics.eslint_d, -- Untuk Web Dev
        -- null_ls.builtins.diagnostics.flake8,     -- Untuk Python
        -- null_ls.builtins.diagnostics.shellcheck, -- Untuk Shell scripts
      })
      return opts
    end,
  },

  -- [2] Konfigurasi conform.nvim untuk MENGGUNAKAN none-ls
  {
    "stevearc/conform.nvim",
    opts = {
      -- Definisikan 'none-ls' sebagai formatter yang bisa digunakan
      formatters = {
        ["none-ls"] = {
          command = "none-ls",
          args = { "format", "-s", "-" },
          stdin = true,
        },
      },
      -- Terapkan 'none-ls' sebagai formatter untuk semua jenis file (*)
      -- Ini akan berjalan bersama formatter lain yang sudah diatur LazyVim
      formatters_by_ft = {
        ["*"] = { "none-ls" },
      },
      -- Atur agar format berjalan saat menyimpan file
      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },
    },
  },
}
