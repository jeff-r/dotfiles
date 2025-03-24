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

local dap = require("dap")

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start debugging" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open Debug Console" })

