---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.lspconfig = {
  n = {
    ["gpd"] = {
      "<cmd> Lspsaga peek_definition <CR>",
      "Lspsaga Peek Definition",
    },
    ["gpD"] = {
      "<cmd> Lspsaga goto_definition <CR>",
      "Lspsaga Go To Definition",
    },
    ["gpt"] = {
      "<cmd> Lspsaga peek_type_definition <CR>",
      "Lspsaga Peek Type Definition",
    },
    ["gpT"] = {
      "<cmd> Lspsaga goto_type_definition <CR>",
      "Lspsaga Go to Type Definition",
    },
    ["gp>"] = {
      "<cmd> Lspsaga diagnostic_jump_next <CR>",
      "Lspsaga Diagnostic Next",
    },
    ["gp<"] = {
      "<cmd> Lspsaga diagnostic_jump_prev <CR>",
      "Lspsaga Diagnostic Prev",
    },
    ["gpf"] = {
      "<cmd> Lspsaga finder def+ref+imp <CR>",
      "Lspsaga Finder Ref & Impl",
    },
  },
}

M.telescope = {
  n = {
    ["<Leader>br"] = {
      "<cmd> Telescope file_browser <CR>",
      "File Browser",
    },
  },
}

-- more keybinds!

return M
