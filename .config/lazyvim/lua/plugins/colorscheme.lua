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
}
