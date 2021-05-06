local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Disable Ex mode
map('n', 'Q', '<nop>', opts)

-- Edit settings
map('', '<leader>c', ':e ~/.config/nvim/lua/settings.lua<cr>', opts)

-- Edit snippets
map('', '<leader>u', ':e ~/.config/nvim/user-snippets/all.snippets<cr>', opts)

-- Save file
map('', '<f1>', '<esc>:w<cr>', opts)
map('', '<f2>', '<esc>:w<cr>', opts)
map('i', '<f1>', '<esc>:w<cr>', opts)
map('i', '<f2>', '<esc>:w<cr>', opts)

-- Spellcheck
map('', '<leader>ts', '<esc>:set spell!<cr>:set spell?<cr>', opts)

-- Create a new tab
map('', '<c-t>', ':tabnew<cr>', opts)
map('n', '<c-t>', ':tabnew<cr>', opts)
map('i', '<c-t>', '<esc>:tabnew<cr>', opts)

-- Previous tab
map('', '<c-left>', ':tabp<cr>', opts)
map('n', '<c-left>', ':tabp<cr>', opts)
map('i', '<c-left>', '<esc>:tabp<cr>', opts)

-- Next tab
map('', '<c-right>', ':tabn<cr>', opts)
map('n', '<c-right>', ':tabn<cr>', opts)
map('i', '<c-right>', '<esc>:tabn<cr>', opts)

-- Do not remove selection when indenting
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Select last inserted text
map('', 'gV', '`[v`]', opts)

-- New line when press Enter in Normal mode
map('n', '<cr>', 'O<down><esc>', opts)
map('n', '<s-cr>', 'O<down><esc>', opts)

-- Moving between splits by <Opt+Arrows>
map('', '<m-down>', '<c-w>j', opts)
map('i', '<m-down>', '<esc><c-w>j', opts)
map('', '<m-up>', '<c-w>k', opts)
map('i', '<m-up>', '<esc><c-w>k', opts)
map('', '<m-left>', '<c-w>h', opts)
map('i', '<m-left>', '<esc><c-w>h', opts)
map('', '<m-right>', '<c-w>l', opts)
map('i', '<m-right>', '<esc><c-w>l', opts)

-- Move a visual block up and down
map('v', 'J', ":m '>+1<cr>gv=gv", opts)
map('v', 'K', ":m '<-2<cr>gv=gv", opts)

-- Create a new split relative to current one
map('', '<leader><left>', ':leftabove vnew<cr>', opts)
map('', '<leader><right>', ':rightbelow vnew<cr>', opts)
map('', '<leader><up>', ':leftabove new<cr>', opts)
map('', '<leader><down>', ':rightbelow new<cr>', opts)

-- Highlight search when press * in visual mode
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<cr><cr>]], opts)

-- Disable the highlighting of search
map('', '<leader>h', '<esc>:let @/ = ""<cr>:nohl<cr>', opts)

-- Sort CSS-properties
map('', '<leader>ss', '<esc>vi{:!sort<cr>', opts)

-- Set filetype
map('', '<leader>fr', ':set ft=ruby<cr>', opts)
map('', '<leader>fh', ':set ft=html<cr>', opts)
map('', '<leader>fx', ':set ft=xml<cr>', opts)
map('', '<leader>fp', ':set ft=php<cr>', opts)
map('', '<leader>fl', ':set ft=lua<cr>', opts)
map('', '<leader>fs', ':set ft=mysql<cr>', opts)
map('', '<leader>fc', ':set ft=css<cr>', opts)
map('', '<leader>fg', ':set ft=graphql<cr>', opts)
map('', '<leader>fv', ':set ft=vue<cr>', opts)
map('', '<leader>fjn', ':set ft=json<cr>', opts)
map('', '<leader>fjs', ':set ft=javascript<cr>', opts)
map('', '<leader>fts', ':set ft=typescript<cr>', opts)
map('', '<leader>fmd', ':set ft=markdown<cr>', opts)

-- Copy path or file name
map('', '<leader>yP', ':let @*=expand("%:p")<cr>:echo "The absolute path was copied"<cr>', opts)
map('', '<leader>yp', ':let @*=expand("%")<cr>:echo "The relative path was copied"<cr>', opts)
map('', '<leader>yf', ':let @*=expand("%:t")<cr>:echo "The filename was copied"<cr>', opts)
map('', '<leader>yd', ':let @*=expand("%:p:h")<cr>:echo "The directory name was copied"<cr>', opts)

-- Ruby hash syntax conversion
map('', '<f9>', [[:%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>]], opts)

-- Generate ctags
map('', '<f10>', ':!ctags -R --exclude=.git --exclude=logs --exclude=doc --exclude=tmp . $(bundle list --paths)<cr>', opts)

-- Toggle true/false value
map(
  'n',
  '<leader><leader>', [[expand('<cword>') == 'true' ? "ciwfalse\<Esc>" : (expand('<cword>') == 'false' ? "ciwtrue\<Esc>" : '')]],
  { noremap = true, silent = true, expr = true }
)

