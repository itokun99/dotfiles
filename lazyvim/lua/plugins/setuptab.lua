return {
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
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
        documentation = { window = { border = "single" } },
      },
      -- completion = { list = { selection = "manual" } },
    },
  },
}
