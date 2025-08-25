return {
  -- conform.nvim
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- flash.nvim
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- nvim-telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- gitsigns.nvim
  { "lewis6991/gitsigns.nvim", event = "VeryLazy", opts = {} },

  -- mini.icons
  { "echasnovski/mini.nvim", version = false },

  -- blink.nvim
  { import = "nvchad.blink.lazyspec" },

  -- none-ls.nvim
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local null_ls = require "null-ls"

      local formatting = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.gofmt,
        -- null_ls.builtins.formatting.gopls,
        null_ls.builtins.formatting.goimports,
        -- null_ls.builtins.formatting.rustfmt,
      }

      -- local diagnostics = {
      --   -- null_ls.builtins.diagnostics.eslint_d,
      --   -- null_ls.builtins.diagnostics.shellcheck,
      -- }

      local code_actions = {
        -- null_ls.builtins.code_actions.eslint_d, -- Menyediakan quick-fix untuk ESLint
        null_ls.builtins.code_actions.gitsigns, -- Menambahkan hunk/line ke gitignore
        -- null_ls.builtins.code_actions.shellcheck, -- Menerapkan perbaikan dari shellcheck
      }

      opts.sources = vim.list_extend(opts.sources or {}, formatting)
      -- vim.list_extend(opts.sources, diagnostics)
      vim.list_extend(opts.sources, code_actions)

      return opts
    end,
  },

  --  yanky.nvim
  {
    "gbprod/yanky.nvim",
    dependencies = {
      { "kkharji/sqlite.lua" },
    },
    opts = {
      ring = { storage = "sqlite" },
    },
    keys = {
      { "<leader>pp", "<cmd>YankyRingHistory<cr>", mode = { "n", "x" }, desc = "Open Yank History" },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },

  -- todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
