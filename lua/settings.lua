local opt = vim.opt

vim.cmd('filetype on')

vim.g.loaded_matchparen = 1 -- Disable highlighting of matching brackets

vim.g.markdown_fenced_languages = {
  'bash', 'sh', 'config', 'css', 'dockerfile', 'git', 'gitconfig', 'html', 'javascript',
  'ruby', 'sass', 'scss', 'css', 'spec', 'sql', 'typescript', 'vue', 'xhtml', 'yaml', 'zsh'
}

vim.cmd 'filetype plugin on'
vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'
vim.cmd 'syn sync maxlines=256'
vim.cmd 'syn sync minlines=0'
vim.cmd 'nnoremap * *N' -- Do not go to the next result when highlighting

vim.cmd.colorscheme('gruvbox')

vim.filetype.add({ extension = { nomad = 'hcl' } })

-- Interface Settings
opt.shortmess = 'filnxtToOCFIc' -- Reduce and shorten messages in the command area
opt.laststatus = 2              -- Always show status line
opt.cmdheight = 2               -- Height of command line
opt.signcolumn = 'yes'          -- Always show sign column
opt.ruler = true                -- Show cursor position
opt.showmode = true             -- Show current mode
opt.showcmd = true              -- Show (partial) command in status line
opt.visualbell = false          -- Disable bell sound

-- Navigation, scrolling, and cursor behavior
opt.cursorline = false    -- Disable cursor line highlight
opt.scrolljump = 0        -- Number of lines to scroll when cursor moves off screen
opt.scrolloff = 0         -- Minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 0     -- Minimal number of columns to keep left and right of the cursor
opt.sidescroll = 0        -- Number of columns to scroll horizontally when cursor moves off screen
opt.mouse = 'a'           -- Enable mouse in all modes
opt.mousemodel = 'popup'  -- Use popup for mouse selection
opt.virtualedit = 'block' -- Allow cursor beyond end of line in visual block mode

-- Search settings
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true  -- Make search case-sensitive only when the pattern contains uppercase letters
opt.hlsearch = true   -- Highlight search matches
opt.incsearch = true  -- Incremental search

-- Text display options
opt.listchars = 'tab:→\\ ,trail:·,nbsp:·,extends:❯,precedes:❮'
opt.synmaxcol = 256 -- Max column for syntax highlighting
opt.list = true     -- Show special characters
opt.number = true   -- Show line numbers

-- Formatting and editing
opt.modeline = false                -- Disable modelines for security
opt.whichwrap = 'b,s'               -- Disables line break when the current line ends
opt.wrap = false                    -- Disable line wrapping
opt.linebreak = true                -- Wrap lines at convenient points (does not work if wrap=false)
opt.autoindent = true               -- Copy indent from current line
opt.smartindent = true              -- Smart autoindenting
opt.tabstop = 2                     -- Number of spaces a <Tab> counts for
opt.shiftwidth = 2                  -- Size of indent
opt.softtabstop = 2                 -- Number of spaces for <Tab> in insert mode
opt.smarttab = true                 -- Use shiftwidth for <Tab> at the start of a line
opt.expandtab = true                -- Use spaces instead of tabs
opt.shiftround = true               -- Round indent to nearest shiftwidth
opt.iskeyword = '@,48-57,_,192-255' -- Define "word" boundaries
opt.backspace = 'indent,eol,start'  -- Backspace through everything in insert mode

opt.formatoptions = vim.bo.formatoptions:gsub('o', '') .. 'j' -- Remove auto comment on new line and add comment leader when joining lines

-- Language, encoding, and input
opt.fileformats = 'unix,mac,dos' -- Recognize line endings from Unix (LF), Mac (CR), and DOS/Windows (CRLF)
opt.fileencodings = 'utf8'       -- Try to open files using UTF-8 encoding
opt.fileformat = 'unix'          -- Default file format
opt.iminsert = 0                 -- Start with Latin keyboard
opt.imsearch = 0                 -- Search with Latin keyboard

-- Clipboard
opt.clipboard = 'unnamedplus' -- Use system clipboard

-- Buffers, history, sessions
opt.history = 128   -- Command-line history length
opt.autoread = true -- Auto reload file if changed outside
opt.sessionoptions = 'curdir,buffers,tabpages,folds,options' -- What to save in sessions

-- Undo, swap, backup
opt.undofile = true   -- Enable persistent undo
opt.undolevels = 2048 -- Undo levels
opt.backup = false    -- Don't use backup files
opt.swapfile = false  -- Don't use swap files
opt.undodir = vim.fn.stdpath('config') .. '/undo' -- Undo directory

-- Folding
opt.foldenable = true                            -- Enable folding
opt.foldlevel = 0                                -- All folds closed by default
opt.foldlevelstart = 99                          -- Open all folds on file open
opt.fillchars = 'fold:-'                         -- Char for closed folds
opt.foldmethod = 'expr'                          -- Manual fold method
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Sets the folding method to use Tree-sitter expressions for better code folding

-- Window splitting
opt.equalalways = false -- Do not equalize split sizes automatically
opt.splitbelow = true   -- Horizontal splits below
opt.splitright = true   -- Vertical splits right

-- Parenthesis and match highlighting
opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 2    -- Time to show matching (in tenths of a second)

-- Completion
opt.completeopt = 'noinsert,menuone,noselect' -- Completion behavior

-- Performance
opt.updatetime = 250 -- Time in ms for CursorHold events, LSP etc
opt.ttimeoutlen = 0  -- Timeout for key codes

-- Directory management
opt.autochdir = false -- Do not auto change working directory
