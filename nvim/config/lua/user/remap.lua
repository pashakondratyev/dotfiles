local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

nnoremap("<leader>pv", ":Ex<CR>")
xnoremap("<leader>p", "\"_dP")

-- navigate buffers
nnoremap("<leader>l", ":bnext<CR>")
nnoremap("<leader>h", ":bprevious<CR>")
nnoremap("<leader>q", ":bdelete<CR>")



