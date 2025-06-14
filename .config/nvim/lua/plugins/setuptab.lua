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
            -- components = {
            --   kind_icon = {
            --     ellipsis = false,
            --     text = function(ctx)
            --       local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
            --       return kind_icon
            --     end,
            --     -- Optionally, you may also use the highlights from mini.icons
            --     highlight = function(ctx)
            --       local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
            --       return hl
            --     end,
            --   },
            -- },
          },
        },
        documentation = { window = { border = "single" } },
      },
      -- completion = { list = { selection = "manual" } },
    },
  },
}
