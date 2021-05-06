local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

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
map('', '[g', '<Plug>(coc-diagnostic-prev)', opts)
map('', ']g', '<Plug>(coc-diagnostic-next)', opts)

--  GoTo code navigation.
map('', 'gd', '<Plug>(coc-definition)', opts)
map('', 'gy', '<Plug>(coc-type-definition)', opts)
map('', 'gi', '<Plug>(coc-implementation)', opts)
map('', 'gr', '<Plug>(coc-references)', opts)

-- Use K to show documentation in preview window.
map('n', 'K', ':call CocAction("doHover")<cr>', opts)

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
