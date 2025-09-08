local h = require('helpers')
local map = vim.keymap.set

-- Disable Ex mode
map('n', 'Q', '<nop>', { silent = true })

-- Save file on F1 or F2
map({'n', 'i', 'v'}, '<f1>', '<esc><cmd>w!<cr>', { desc = 'Save file' })
map({'n', 'i', 'v'}, '<f2>', '<esc><cmd>w!<cr>', { desc = 'Save file' })

-- QuickFix
map('n', '<leader>q', h.toggle_quickfix_list, { desc = 'Toggle QuickFix list' })
map('n', '<c-up>', h.safe_cprev, { desc = 'Display previous entry' })
map('n', '<c-down>', h.safe_cnext, { desc = 'Display next entry' })

-- Tabs
map('n', '<c-t>', '<cmd>tabnew<cr>', { desc = 'Create new tab' })
map('i', '<c-t>', '<esc><cmd>tabnew<cr>', { desc = 'Create new tab' })
map('n', '<c-left>', '<cmd>tabp<cr>', { desc = 'Switch to previous tab' })
map('i', '<c-left>', '<esc><cmd>tabp<cr>', { desc = 'Switch to previous tab' })
map('n', '<c-right>', '<cmd>tabn<cr>', { desc = 'Switch to next tab' })
map('i', '<c-right>', '<esc><cmd>tabn<cr>', { desc = 'Switch to next tab' })

-- Moving between splits by Opt+Arrows
map('n', '<m-down>', '<c-w>j', { desc = 'Move to down split' })
map('i', '<m-down>', '<esc><c-w>j', { desc = 'Move to down split' })
map('n', '<m-up>', '<c-w>k', { desc = 'Move to up split' })
map('i', '<m-up>', '<esc><c-w>k', { desc = 'Move to up split' })
map('n', '<m-left>', '<c-w>h', { desc = 'Move to left split' })
map('i', '<m-left>', '<esc><c-w>h', { desc = 'Move to left split' })
map('n', '<m-right>', '<c-w>l', { desc = 'Move to right split' })
map('i', '<m-right>', '<esc><c-w>l', { desc = 'Move to right split' })

-- Splitting
map('n', '<leader><left>', '<cmd>leftabove vnew<cr>', { desc = 'Create split left' })
map('n', '<leader><right>', '<cmd>rightbelow vnew<cr>', { desc = 'Create split right' })
map('n', '<leader><up>', '<cmd>leftabove new<cr>', { desc = 'Create split up' })
map('n', '<leader><down>', '<cmd>rightbelow new<cr>', { desc = 'Create split down' })

-- Disable page scroll by shift+down and shift+-up
map('n', '<s-up>', 'k', { silent = true })
map('n', '<s-down>', 'j', { silent = true })

-- Do not remove selection when indenting
map('v', '<', '<gv', { silent = true })
map('v', '>', '>gv', { silent = true })

-- Select last inserted text
map('n', 'gV', '`[v`]', { silent = true })

-- Searches for the yanked text, escaping special characters
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<cr><cr>]], { silent = true })

-- Disable the highlighting of search
map('n', '<leader>h', '<cmd>let @/ = ""<cr>:nohl<cr>', { silent = true })

-- Sort entries inside curly brackets
map('n', '<leader>so', '<esc>vi{:!sort<cr>', { desc = 'Sort entries inside curly brackets' })

-- Ruby hash syntax conversion
map('n', '<f9>', [[:%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>]], { desc = 'Convert Ruby hash-rocket syntax to symbolized' })

-- Open links in browser
map('n', 'gx', 'yiW:!open <cWORD><cr>', { desc = 'Open link in web browser' })

-- Toggle true/false value
map('n', '<leader><leader>', h.toggle_boolean, { silent = true, desc = 'Toggle Boolean Values' })
