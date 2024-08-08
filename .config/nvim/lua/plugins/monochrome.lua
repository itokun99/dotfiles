return {
  {
    "amedoeyes/eyes.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      pallete = "dark",
      extend = {
        highlights = {
          StatusLine = { bg = "none" },
          StatusLineNC = { bg = "none" },
          TabLine = { bg = "none" },
          Normal = { bg = "none" },
          NormalFloat = { link = "Normal" },
        },
        palette = {
          hex00 = "#202020",
          hex01 = "#404040",
          hex02 = "#505050",
          hex03 = "#606060",
          hex04 = "#707070",
          hex05 = "#808080",
          hex06 = "#909090",
          hex07 = "#A0A0A0",
          hex08 = "#B0B0B0",
          hex09 = "#C0C0C0",
          hex10 = "#D0D0D0",
          hex11 = "#E0E0E0",
          hex12 = "#F0F0F0",
          hex13 = "#FFF0F0",
          hex14 = "#FFFFF0",
          hex15 = "#FFFFFF",
        },
      },
    },
  },
}
