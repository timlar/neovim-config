vim.o.filetype = 'off' -- Disable filetypes

vim.g.loaded_matchparen = 1 -- Disable highlighting of matching brackets
vim.g.mapleader = ','
vim.g.macvim_skip_cmd_opt_movement = 1
vim.g.markdown_fenced_languages = {
  'bash=sh', 'config', 'css', 'dockerfile', 'git', 'gitconfig', 'html', 'javascript', 'ruby', 'sass', 'scss', 'spec',
  'sql', 'typescript', 'vue', 'xhtml', 'yaml', 'zsh'
}

vim.cmd 'filetype plugin on'
vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'

vim.cmd 'colorscheme base16-gruvbox-dark-medium'

-- Improve performance
vim.cmd 'syn sync maxlines=256' -- 200
vim.cmd 'syn sync minlines=256' -- 50

-- vim.cmd 'syn match markdownError "\w\@<=\w\@="' -- Error pattern without the underscore

vim.cmd 'nnoremap * *N' -- Do not go to the next result when highlighting

vim.o.background = 'dark'
vim.o.termguicolors = true

vim.o.shortmess = vim.o.shortmess..'I' -- Disable 'Children of Uganda'

vim.o.modeline = false
vim.wo.cursorline = false
vim.bo.synmaxcol = 256

vim.o.list = true
vim.o.listchars = [[tab:→\ ,trail:·,nbsp:·,extends:❯,precedes:❮]]

vim.o.sessionoptions = 'curdir,buffers,tabpages,folds,options' -- Sessions

vim.bo.keymap = 'russian-jcukenwin'
vim.o.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

vim.bo.spelllang = 'ru_yo,en_us'

vim.o.fileformats = 'unix,mac,dos'
vim.o.fileencodings = 'utf8,cp1251'
vim.bo.fileformat = 'unix'
vim.o.encoding = 'utf-8'

vim.bo.iskeyword = '@,48-57,_,192-255' -- Fix: It needs for define correct position of the word when press 'w', 'b' or '*'
vim.o.backspace = 'indent,eol,start'
vim.o.whichwrap = 'b,s' -- Disable transition to a new line when line ends

vim.wo.number = true -- set relativenumber " /!\ SLOW /!\

vim.wo.wrap = false

vim.o.virtualedit = ''

if vim.fn.has('folding') == 1 then
  vim.wo.foldenable = false
  vim.wo.foldmethod = 'indent' -- 'syntax' or 'manual'
  vim.o.foldlevel = 0 -- 99
  vim.o.foldlevelstart = 0 -- 99
  vim.o.fillchars = vim.o.fillchars .. 'fold:-'
end

vim.o.mouse = 'a'
vim.o.mousemodel = 'popup'

vim.o.lazyredraw = true
-- vim.o.ttyfast = true

vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true

vim.bo.iminsert = 0 -- Latin keyboard by default
vim.bo.imsearch = 0

vim.o.laststatus = 2 -- Always show command line

vim.o.scrolljump = 0
vim.o.scrolloff = 0

vim.o.splitbelow = true
vim.o.splitright = false

vim.o.equalalways = false

-- vim.o.showtabline = 2 -- Always show tabs

vim.o.history = 128

vim.o.undofile = true
vim.o.undolevels = 2048
vim.o.undodir = vim.fn.stdpath('config') .. '/undo'

vim.o.backup = false
vim.bo.swapfile = false

vim.o.visualbell = false

vim.o.ruler = true

vim.o.showmode = true
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.matchtime = 2

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.smarttab = true
vim.o.expandtab = true -- use spaces instead of tabs
vim.o.shiftround = true

vim.bo.autoindent = true
vim.bo.smartindent = true

vim.o.autoread = true

vim.o.completeopt = 'menu,menuone,longest,preview'

vim.o.scrolloff = 0
vim.o.sidescrolloff = 0
vim.o.sidescroll = 0

vim.bo.formatoptions = vim.bo.formatoptions:gsub('o', '')
vim.bo.formatoptions = vim.bo.formatoptions .. 'j' -- Remove a comment leader when joining lines

vim.o.fillchars = '' -- Remove the ugly splits separator

-- execute 'vim.wo.colorcolumn=' . join(range(121,335), ',')
vim.wo.colorcolumn = '121'
vim.bo.textwidth = 119

vim.wo.linebreak = true

vim.o.cmdheight = 2

vim.wo.signcolumn = 'yes' -- Always show the signcolumn

if vim.fn.substitute(vim.fn.system('uname'), '\n', '', '') == 'Darwin' then
  vim.o.clipboard = 'unnamed' -- Use system clipboard
end

-- Set current directory as root
vim.o.autochdir = false

vim.cmd [[
  augroup SetRootDirectory
    autocmd VimEnter * silent! lcd %:p:h
  augroup END
]]

-- Remember cursor position
vim.cmd [[
  augroup RememberCursorPosition
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"zz" | endif
  augroup END
]]

-- Highlight search results
vim.cmd [[
  augroup ALEHighlight
    hi Search guifg=#fbf2c7 guibg=#d65d0e
  augroup END
]]

-- Highlight specific words
vim.cmd [[
  augroup HighlightDebugger
    au BufEnter *.rb match error "\<\(binding.pry\|focus: true\|:focus\)\>"
    au BufEnter *.js match error "\<debugger\>"
  augroup END
]]

-- Disable underline links in HTML
vim.cmd [[
  augroup HTMLSyntax
    hi def link htmlLink NONE
  augroup END
]]
