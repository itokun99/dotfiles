return {

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

  { "rafamadriz/friendly-snippets", enabled = false },
  {
    -- Nonaktifkan layar startup/dashboard
    { "goolord/alpha-nvim", enabled = false },

    -- Nonaktifkan indent line (garis vertikal untuk indentasi)
    -- { "lukas-reineke/indent-blankline.nvim", enabled = },

    -- Jika Anda tidak terlalu peduli dengan ikon, menonaktifkan ini memberi perbedaan
    { "nvim-tree/nvim-web-devicons", enabled = false },
  },
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
}
