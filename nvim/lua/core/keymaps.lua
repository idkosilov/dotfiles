-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }

-- 🔄 Better movement in wrapped lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- 🔍 Search & center cursor
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts) -- Clear search highlights
vim.keymap.set('n', 'n', 'nzzzv', opts) -- Center screen after searching forward
vim.keymap.set('n', 'N', 'Nzzzv', opts) -- Center screen after searching backward

-- 📜 Scroll while keeping cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- 🖊 Save & quit
vim.keymap.set('n', '<leader>s', '<cmd>w<CR>', opts) -- Save file
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', opts) -- Quit file
vim.keymap.set('n', '<leader>Q', '<cmd>qa!<CR>', opts) -- Quit all without saving
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", command = "silent! w" }) -- Auto-save on leaving insert mode

-- 🗂 Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts) -- Go to next buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts) -- Go to previous buffer
vim.keymap.set('n', '<leader>bd', ':bdelete!<CR>', opts) -- Close buffer
vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', opts) -- Open a new buffer

-- 🖥 Window (split) management
vim.keymap.set('n', '<leader>sv', '<C-w>v', opts) -- Split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', opts) -- Split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- Make splits equal size
vim.keymap.set('n', '<leader>sx', ':close<CR>', opts) -- Close current split

-- 🔀 Move between splits
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)

-- 🔠 Text formatting & editing
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts) -- Toggle line wrapping
vim.keymap.set('n', '<leader>j', '*``cgn', opts) -- Replace  under cursor

-- 📌 Copy & paste improvements
vim.keymap.set('v', 'p', '"_dP', opts) -- Keep the last yanked text when pasting
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y"]], opts) -- Copy to system clipboard
vim.keymap.set('n', '<leader>Y', [["+Y"]], opts)

-- 🔄 Move selected text
vim.keymap.set('v', '<Tab>', '>gv', opts) -- Indent right
vim.keymap.set('v', '<S-Tab>', '<gv', opts) -- Indent left

-- ❌ Delete without copying to register
vim.keymap.set('n', 'x', '"_x', opts)

-- 🔧 Resize splits using arrow keys
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)
