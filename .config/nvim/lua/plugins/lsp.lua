local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- inline hint
      inlay_hints = {
        enabled = false,
      },
      format_notify = true,
      -- -- Useful for debugging formatter issues
      -- format_notify = true,
      -- servers = {
      --   -- regols is not maanged by Mason. i install it with `brew install kitagry/tap/regols`.
      --   -- See: https://github.com/kitagry/regols
      --   regols = {},
      --   -- This should be renamed to `ruby_lsp` once this PR gets merged
      --   -- https://github.com/williamboman/mason-lspconfig.nvim/pull/395
      --   ruby_lsp = {
      --     -- cmd = { "bundle", "exec", "ruby-lsp" },
      --     -- init_options = {
      --     --   formatter = "auto",
      --     -- },
      --   },
      --   rubocop = {
      --     -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
      --     cmd = { "bundle", "exec", "rubocop", "--lsp" },
      --     root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
      --   },
      -- },
    },
  },
}
