-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('n', '<C-PageDown>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-PageUp>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })

vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>a", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Remap Shift-h to move to the top of the page
vim.keymap.set("n", "H", "H", { desc = "Move to top of file" })

-- Remap Shift-l to move to the bottom of the page
vim.keymap.set("n", "L", "L", { desc = "Move to bottom of file" })

