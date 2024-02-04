local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map('', '<leader>rr', ':VimuxPromptCommand<cr>', opts)
map('', '<leader>rl', ':VimuxRunLastCommand<cr>', opts)
map('', '<leader>rc', ':VimuxCloseRunner<cr>', opts)
map('', '<leader>ri', ':VimuxInterruptRunner<cr>', opts)
map('', '<leader>rz', ':VimuxZoomRunner<cr>', opts)
map('', '<leader>rb', ':call VimuxRunCommand("clear; rspec " . bufname("%"))<cr>', opts)

vim.g.VimuxHeight = 40
vim.g.VimuxOrientation = 'v'
vim.g.VimuxPromptString = ' '
