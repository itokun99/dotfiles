-- ~/.config/nvim/lua/custom/themes/flat_mono.lua

-- [1] Muat tema monokrom bawaan NvChad sebagai dasar
local theme = require "base46.themes.monochrome"

-- [2] Ambil beberapa warna kunci dari palet dasarnya untuk kita gunakan
local fg = theme.palette.fg -- Warna teks utama (putih gading)
local white = theme.palette.white -- Putih paling terang
local gray = theme.palette.comment -- Abu-abu untuk komentar

-- [3] Override highlight groups untuk Tree-sitter dan elemen lain
-- Di sini kita memaksa semua elemen sintaks untuk menggunakan warna yang sangat terbatas.

-- Elemen dasar
theme.highlights.Comment = { fg = gray, style = "italic" }
theme.highlights.Error = { fg = white, style = "bold" }

-- Tree-sitter syntax groups
theme.highlights["@variable"] = { fg = fg }
theme.highlights["@parameter"] = { fg = fg, style = "italic" }
theme.highlights["@string"] = { fg = fg }
theme.highlights["@character"] = { fg = fg }
theme.highlights["@number"] = { fg = fg }
theme.highlights["@boolean"] = { fg = fg }
theme.highlights["@property"] = { fg = fg }
theme.highlights["@field"] = { fg = fg }
theme.highlights["@tag"] = { fg = fg }
theme.highlights["@tag.delimiter"] = { fg = gray }

-- Elemen yang ingin kita tonjolkan sedikit
theme.highlights["@function"] = { fg = white, style = "bold" }
theme.highlights["@function.macro"] = { fg = white, style = "bold" }
theme.highlights["@keyword"] = { fg = white }
theme.highlights["@type"] = { fg = white }
theme.highlights["@constructor"] = { fg = white, style = "bold" }
theme.highlights["@operator"] = { fg = white }
theme.highlights["@punctuation.bracket"] = { fg = fg } -- Bracket standar

-- [4] Override warna untuk plugin bracket berwarna (Rainbow Delimiters)
theme.highlights.RainbowDelimiterRed = { fg = gray }
theme.highlights.RainbowDelimiterYellow = { fg = gray }
theme.highlights.RainbowDelimiterGreen = { fg = gray }
theme.highlights.RainbowDelimiterBlue = { fg = gray }
theme.highlights.RainbowDelimiterViolet = { fg = gray }
theme.highlights.RainbowDelimiterCyan = { fg = gray }
theme.highlights.RainbowDelimiterOrange = { fg = gray }

-- [5] Kembalikan tema yang sudah kita modifikasi
return theme
