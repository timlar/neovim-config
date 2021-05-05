-- TextEdit might fail if hidden is not set.
vim.o.hidden = true

-- Some servers have issues with backup files, see #649.
vim.o.backup = false
vim.o.writebackup = false

-- Give more space for displaying messages.
vim.o.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
vim.o.updatetime = 500

-- Don't pass messages to |ins-completion-menu|.
vim.o.shortmess = vim.o.shortmess..'c'

-- Use `[g` and `]g` to navigate diagnostics
vim.api.nvim_set_keymap('', '[g', '<Plug>(coc-diagnostic-prev)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', ']g', '<Plug>(coc-diagnostic-next)', { noremap = true, silent = true })

--  GoTo code navigation.
vim.api.nvim_set_keymap('', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'gy', '<Plug>(coc-type-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'gi', '<Plug>(coc-implementation)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })

-- Use K to show documentation in preview window.
vim.api.nvim_set_keymap('n', 'K', ':call CocAction("doHover")<cr>', { noremap = true, silent = true })

-- vim.o.statusline = [[%{coc#status()}%{get(b:,'coc_current_function','')}]]..vim.o.statusline

-- autocmd CursorHold * silent call CocActionAsync('highlight')
vim.cmd [[
  augroup CocVimConfig
    " au BufNewFile,BufRead *.ts setlocal filetype=typescript
    au FileType json syntax match Comment +\/\/.\+$+

    hi CocErrorSign ctermfg=1 ctermbg=10 guifg=#fb4934 guibg=#3c3836
    hi CocWarningSign ctermfg=3 ctermbg=10 guifg=#fabd2f guibg=#3c3836
    hi CocInfoSign ctermfg=3 ctermbg=10 guifg=#fabd2f guibg=#3c3836
  augroup END
]]
