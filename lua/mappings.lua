require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("v", ";",  "<ESC>")

vim.api.nvim_set_keymap("n", "ZZ", ":wq!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "QQ", ":qa!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "QZ", ":w!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "QZ", ":w!<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "ZJ", ":m-2<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "ZK", ":m+1<CR>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("v", "ZJ", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "ZK", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Keymaps To Move The Selected Text Upright/Downright.
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<leader>[", "c{}<ESC>P", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<leader>9", "gv<c-o>:normal i(<esc>A)<esc>", { noremap = true, silent = true })
-- Work In Progress. Had To Combine The Two Command Together.
vim.api.nvim_set_keymap("n", "<C-9>", ":normal! i{", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-0>", ":normal! A}", { noremap = true, silent = true })
-- vnoremap <C-K> :m '<-2<CR>gv=gv
-- vnoremap <C-J> :m '>+1<CR>gv=gv
map("v", "<C-b>", "c{}<ESC>p")
-- vim.api.nvim_set_keymap("v", "<C-b>", ":normal! S{}<esc>P", { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set('v', '<C-b>', function ()
  vim.cmd('normal! I{')
  vim.cmd('normal! A}')
end, { desc = "Surround with braces in visual mode" })

vim.keymap.set('v', '<C-9>', function ()
  vim.cmd('normal! I(')
  vim.cmd('normal! A)')
end, { desc = "Surround with kurung in visual mode" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
