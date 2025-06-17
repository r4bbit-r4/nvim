--
-- Keymap settings
--

-- Remap the leader key
vim.g.mapleader = ' '

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move to window using the <C-hjkl> keys
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Switch to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Switch to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Switch to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Switch to right window' })

-- Move to window using the <leader>+w+h|j|k|l keys
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Switch to left window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Switch to lower window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Switch to upper window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Switch to right window' })

-- Buffer management
vim.keymap.set('n', '<leader>bc', ':enew<CR>', { desc = 'Create new buffer' })
vim.keymap.set('n', '<leader>bw', ':write<CR>', { desc = 'Write buffer' })
vim.keymap.set('n', '<leader>bq', ':bdelete<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Tab management
vim.keymap.set('n', '<leader>tc', ':tabnew<CR>', { desc = 'Create new tab' })
vim.keymap.set('n', '<leader>tq', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Previous tab' })

-- Window splitting
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { desc = 'Horizontal split' })


