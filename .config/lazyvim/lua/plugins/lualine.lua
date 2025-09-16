-- ~/.config/nvim/lua/plugins/lualine.lua

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- [1] Buat komponen baru menggunakan fungsi modern vim.lsp.get_clients()
    local function lsp_client_names()
      -- Dapatkan buffer saat ini
      local bufnr = vim.api.nvim_get_current_buf()
      -- Gunakan vim.lsp.get_clients() dengan filter
      local clients = vim.lsp.get_clients({ bufnr = bufnr })

      if #clients == 0 then
        return ""
      end

      local client_names = {}
      for _, client in ipairs(clients) do
        table.insert(client_names, client.name)
      end

      return "󰒋 LSP: " .. table.concat(client_names, ", ")
    end

    -- [2] Masukkan komponen baru dan 'filetype' ke dalam lualine
    table.insert(opts.sections.lualine_x, 1, { "filetype", icon_only = true, separator = "" })
    table.insert(opts.sections.lualine_x, 2, { lsp_client_names, separator = { right = "" } })

    return opts
  end,
}
