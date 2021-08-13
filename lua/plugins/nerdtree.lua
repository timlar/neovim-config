local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.o.autochdir = false

vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeWinSize = 40
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeCascadeSingleChildDir = 0
vim.g.NERDTreeHighlightCursorline = 0
vim.g.NERDTreeShowBookmarks = 0
vim.g.NERDTreeDirArrowExpandable = ''
vim.g.NERDTreeDirArrowCollapsible = ''

vim.g.nerdtree_tabs_open_on_gui_startup = 0
vim.g.nerdtree_tabs_open_on_new_tab = 0

vim.g.WebDevIconsNerdTreeBeforeGlyphPadding = ''
vim.g.WebDevIconsUnicodeDecorateFolderNodes = true
vim.g.DevIconsEnableFoldersOpenClose = 1
vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
vim.g.DevIconsDefaultFolderOpenSymbol = ''

map('', '<f3>', ':NERDTreeToggle<cr>', opts)
map('', '<s-f3>', ':NERDTreeFind<cr>', opts)

vim.cmd [[
  function! StartUp()
    if 0 == argc()
        NERDTree
    end
  endfunction

  augroup NERDTree
    au VimEnter * call StartUp()
  augroup END
]]

-- temp:
-- let g:netrw_banner = 0
-- let g:netrw_liststyle = 3
-- let g:netrw_browse_split = 4
-- let g:netrw_winsize = 20
