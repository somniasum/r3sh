
vim.g.mapleader = " "
vim.api.nvim_set_keymap('i', 'ii', '<ESC>', {noremap = true})
vim.notify = require("notify")
vim.o.relativenumber = true

--all the calls

require('packages')

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

--keymappings
vim.api.nvim_set_keymap("n", '<leader>t', ':NvimTreeToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", '<leader>c', '<C-W>', {noremap = true, silent = true})
require('treesitter-config')
require('lualine-config')
require('nightfox-config')
require('barbar-config')
require('nvimtree')
require('nvim-debugger')

