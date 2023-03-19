vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Move visual blocks of code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- navigate buffers
vim.keymap.set("n", "<leader>l", ":bnext<CR>")
vim.keymap.set("n", "<leader>h", ":bprevious<CR>")
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")
vim.keymap.set("n", "<leader>r", vim.lsp.buf.format)

-- keep cursor centered
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- remap splits
vim.keymap.set("n", "<C-w>|", ":split<CR>")
vim.keymap.set("n", "<C-w>_", ":vsplit<CR>")

vim.keymap.set("n", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd> silent !tmux neww tmux-sessionizer<CR>")

-- replace word that is being hovered
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
