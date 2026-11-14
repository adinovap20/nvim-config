local map = vim.keymap.set

-- Clear Search Highlights
map('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc='Clear search highlights'})

-- Better window navigation
map('n', '<C-h>', '<C-w>h', {desc='Move to left window'})
map('n', '<C-j>', '<C-w>j', {desc='Move to lower window'})
map('n', '<C-k>', '<C-w>k', {desc='Move to upper window'})
map('n', '<C-l>', '<C-w>l', {desc='Move to right window'})

-- Stay in visual mode when indenting with < or >
map('v', '<', '<gv', {desc='Indent left and stay in visual mode'})
map('v', '>', '>gv', {desc='Indent right and stay in visual mode'})

-- Move highlighted lines up and down in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv'", {desc='Move selection down'})
map('v', 'K', ":m '<-2<CR>gv=gv'", {desc='Move selection up'})

-- Keep cursor centered when jumping half-pages up and down
map('n', '<C-d>', '<C-d>zz', {desc='Scroll down and center'})
map('n', '<C-u>', '<C-u>zz', {desc='Scroll up and center'})

-- Keep search matches centered when jumping next/previous
map('n', 'n', 'nzzzv', {desc='Next search match'})
map('n', 'N', 'Nzzzv', {desc='Previous search match'})

-- Buffer management
map('n', '<S-Tab>', '<cmd>bprevious<CR>', {desc='Go to previous buffer'})
map('n', '<Tab>', '<cmd>bnext<CR>', {desc='Go to next buffer'})
map('n', '<leader>x', '<cmd>bdelete<CR>', {desc='Close current buffer'})

-- Explorer
map('n', '<leader>e', '<cmd>e .<CR>', {desc='Open File Explorer'})

