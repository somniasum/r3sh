-- ~/.config/nvim/lua/config/vimtex.lua

vim.g.vimtex_view_method = 'zathura'  -- You can use other viewers like 'skim', 'evince', or 'okular'
vim.g.vimtex_compiler_latexmk = {
    build_dir = '',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    options = { '-shell-escape', '-bibtex', '-silent' }
}

-- Other vimtex settings
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_indent_enabled = 1

