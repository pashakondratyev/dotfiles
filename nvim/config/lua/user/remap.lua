local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

nnoremap("<leader>pv", ":Ex<CR>")

xnoremap("<leader>p", "\"_dP")
