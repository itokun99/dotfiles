return {
  {
    "amedoeyes/eyes.nvim",
    lazy = "VeryLazy",
    priority = 1000,
    opts = {
      transparent = true,
      extend = {
        palette = {
          hex00 = "#1F1F1F", -- black (sedikit diangkat dari hitam pekat)
          hex01 = "#2B2B2B", -- dark gray
          hex02 = "#383838", -- medium dark gray
          hex03 = "#4F4F4F", -- medium gray
          hex04 = "#676767", -- gray
          hex05 = "#808080", -- light gray (abu-abu netral)
          hex06 = "#9A9A9A", -- very light gray
          hex07 = "#B3B3B3", -- lighter gray
          hex08 = "#CCCCCC", -- off-white
          hex09 = "#E5E5E5", -- very light off-white (sebelumnya kuning)
          hex10 = "#FFFFFF", -- white (putih bersih untuk sorotan)
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "eyes",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "eyes",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- Atur ini menjadi true agar bufferline selalu terlihat
        always_show_bufferline = true,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- [1] Buat komponen baru menggunakan fungsi modern vim.lsp.get_clients()
      local function lsp_client_names()
        -- Dapatkan buffer saat ini
        local bufnr = vim.api.nvim_get_current_buf()
        -- Gunakan vim.lsp.get_clients() dengan filter
        local clients = vim.lsp.get_clients({ bufnr = bufnr })

        if #clients == 0 then
          return ""
        end

        local client_names = {}
        for _, client in ipairs(clients) do
          table.insert(client_names, client.name)
        end

        return "󰒋 LSP: " .. table.concat(client_names, ", ")
      end

      -- [2] Masukkan komponen baru dan 'filetype' ke dalam lualine
      table.insert(opts.sections.lualine_x, 1, { "filetype", icon_only = true, separator = "" })
      table.insert(opts.sections.lualine_x, 2, { lsp_client_names, separator = { right = "" } })

      return opts
    end,
  },

  -- disable snipet
  { "rafamadriz/friendly-snippets", enabled = false },

  -- Nonaktifkan layar startup/dashboard
  { "goolord/alpha-nvim", enabled = false },

  -- Nonaktifkan indent line (garis vertikal untuk indentasi)
  -- { "lukas-reineke/indent-blankline.nvim", enabled = },

  -- Jika Anda tidak terlalu peduli dengan ikon, menonaktifkan ini memberi perbedaan
  { "nvim-tree/nvim-web-devicons", enabled = false },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- Matikan pemisahan buffer berdasarkan direktori/LSP
        -- Ini mengurangi kalkulasi yang harus dilakukan
        separator_style = "thin",
        -- Tampilkan nama buffer saja, tanpa path
        mode = "buffers",
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Esc>"] = { "hide", "fallback" },
        ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
        ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
      },
      completion = {
        menu = {
          border = "single",
          draw = {
            columns = {
              {
                "kind_icon",
                "label",
                "label_description",
                gap = 0,
              },
              {
                "kind",
              },
            },
          },
        },
        trigger = {
          show_in_snippet = false,
        },
        documentation = { window = { border = "single" }, auto_show = true, auto_show_delay_ms = 1000 },
      },
    },
  },
}
