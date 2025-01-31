return {
  -- add dracula
  -- {
  --   "Mofiqul/dracula.nvim",
  --   opts = {
  --     transparent_bg = false,
  --     italic_comment = true,
  --   },
  -- },

  -- Configure LazyVim to load dracula
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin",
  --     style = "mocha",
  --   },
  -- },
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
}
