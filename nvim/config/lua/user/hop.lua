local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap

require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

nnoremap("<leader>f", "<cmd>lua require'hop'.hint_char1({multi_windows = true })<cr>")

