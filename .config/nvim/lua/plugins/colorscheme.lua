return {
  {
    "amedoeyes/eyes.nvim",
    lazy = "VeryLazy",
    priority = 1000,
    opts = {
      transparent = true,
      extend = {
        palette = {
          hex00 = "#222222", -- black (tmux hex00 = dark gray)
          hex01 = "#303030", -- dark gray (tmux hex01)
          hex02 = "#555555", -- medium dark gray (tmux hex02)
          hex03 = "#777777", -- medium gray (tmux hex03)
          hex04 = "#888888", -- light gray (tmux hex04)
          hex05 = "#999999", -- gray (tmux hex05)
          hex06 = "#b3b3b3", -- light gray (tmux hex06)
          hex07 = "#cccccc", -- very light gray (tmux hex07)
          hex08 = "#e6e6e6", -- lighter gray (tmux hex08)
          hex09 = "#f0f0f0", -- yellow (tmux hex09)
          hex10 = "#ffffff", -- white (tmux hex10)
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
}
