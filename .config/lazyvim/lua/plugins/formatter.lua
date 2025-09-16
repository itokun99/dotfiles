return {
  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local null_ls = require("null-ls")
  --     opts.sources = opts.sources or {}
  --     vim.list_extend(opts.sources, {
  --       -- Formatting
  --       null_ls.builtins.formatting.stylua, -- Untuk Lua
  --       null_ls.builtins.formatting.prettier, -- Untuk Web Dev (JS, TS, CSS, JSON)
  --       -- null_ls.builtins.formatting.black, -- Untuk Python
  --       null_ls.builtins.formatting.gofmt, -- Untuk Go
  --       null_ls.builtins.formatting.goimports, -- Untuk Go (mengatur imports)
  --
  --       -- Diagnostics (Linting)
  --       -- null_ls.builtins.diagnostics.eslint_d, -- Untuk Web Dev
  --     })
  --     return opts
  --   end,
  -- },

  -- [2] Konfigurasi conform.nvim untuk MENGGUNAKAN none-ls
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["*"] = { "none-ls" },
      },
      formatters = {
        ["none-ls"] = {
          -- Ini adalah konfigurasi yang hilang sebelumnya
          command = "none-ls",
          args = { "format", "-s", "-" },
          stdin = true,
        },
      },
    },
  },
}
