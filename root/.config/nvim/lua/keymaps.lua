vim.keymap.set('n', ';', ':', {})
vim.keymap.set('n', '<leader>a', ':w<cr>', {})
vim.keymap.set('n', '<leader>r', ':source ~/.config/nvim/init.lua<cr>', { desc = 'Reload nvim config' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<Leader>gd', '<C-]>', { desc = 'Go to definition' })
vim.keymap.set('n', '<Leader>d', '<C-]>', { desc = 'Go to definition' })
vim.keymap.set('n', '<leader><tab>', '<C-^>')

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sf',       builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sg',       builtin.live_grep,  { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>sb',       builtin.buffers,    { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>sh',       builtin.help_tags,  { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>n',  ':Neotree toggle last<cr>',       { desc = 'Neotree last' })
vim.keymap.set('n', '<leader>nf', ':Neotree toggle filesystem<cr>', { desc = 'Neotree filesystem' })
vim.keymap.set('n', '<leader>nr', ':Neotree toggle filesystem reveal<cr>', { desc = 'Neotree filesystem' })
vim.keymap.set('n', '<leader>ng', ':Neotree toggle git_status<cr>', { desc = 'Neotree git_status' })
vim.keymap.set('n', '<leader>nb', ':Neotree toggle buffers<cr>',    { desc = 'Neotree buffers' })
-- vim.keymap.set('n', '<leader>ns', ':Neotree toggle document_symbols<cr>',    { desc = 'Neotree document_symbols' })

