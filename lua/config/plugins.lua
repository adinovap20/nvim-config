vim.pack.add({
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/echasnovski/mini.pairs',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/akinsho/toggleterm.nvim',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/refractalize/oil-git-status.nvim',
})

-- colorscheme
vim.cmd.colorscheme('tokyonight-night')

-- File explorer
require('oil').setup({
    default_file_explorer = true,
    float = {
        padding = 4,
        border = 'rounded',
    },
    view_options = {
        show_hidden = true,
    },
    win_options = {
        signcolumn = "yes:2",
    },
})
vim.keymap.set('n', '-', '<cmd>Oil --float<CR>', {desc='Open Parent Directory'})

-- Mini pairs for auto pairing brackets and other minor characters
require('mini.pairs').setup()

-- Statusline
require('lualine').setup({
    options = {
        theme = 'tokyonight',
        globalstatus = true,
    },
})

-- Toggleterm
require('toggleterm').setup({
    open_mapping = [[<C-\>]],
    direction = 'float',
    float_opts = {
        border = 'rounded',
    },
})

-- Gitsigns
require('gitsigns').setup({})

-- Oil git status
require('oil-git-status').setup({})
