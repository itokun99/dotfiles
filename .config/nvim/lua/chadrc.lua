-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  -- theme = "onedark",
  theme = "monochrome",
  transparency = true,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    ["@punctuation.bracket"] = {
      fg = "white",
    },
    ["@variable"] = {
      fg = "white",
    },
    ["@variable.builtin"] = {
      fg = "white",
    },
    ["@variable.parameter"] = {
      fg = "white",
    },
    ["@constant"] = {
      fg = "white",
    },
    ["@constant.builtin"] = {
      fg = "white",
    },
    ["@string"] = {
      fg = "white",
    },
    NvimTreeFolderIcon = {
      fg = "white",
    },
    NvimTreeFolderName = {
      fg = "white",
    },
    NvimTreeEmptyFolderName = {
      fg = "white",
    },
    NvimTreeCursorLine = {
      fg = "white",
      bg = "one_bg3",
    },
    NvimTreeSpecialFile = {
      fg = "white",
    },
    NvimTreeNormal = {
      fg = "white",
    },
    NvimTreeIndentMarker = {
      fg = "white",
    },
    Tabline = {},
    TbBufOn = {
      bg = "one_bg3",
    },
    NvimTreeOpenedFolderName = {
      fg = "white",
    },
    St_InsertMode = {
      bg = "white",
    },
    St_NormalMode = {
      bg = "white",
    },
    St_NTerminalMode = {
      bg = "white",
    },
    St_cwd_icon = {
      bg = "white",
    },
  },
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

M.ui = {
  statusline = {
    theme = "vscode",
  },
}

return M
