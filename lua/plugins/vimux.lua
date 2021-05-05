vim.g.VimuxHeight = 40
vim.g.VimuxOrientation = 'v'
vim.g.VimuxPromptString = '~> '

vim.api.nvim_set_keymap('', '<leader>rr', ':VimuxPromptCommand<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>rl', ':VimuxRunLastCommand<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>rc', ':VimuxCloseRunner<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>ri', ':VimuxInterruptRunner<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>rz', ':VimuxZoomRunner<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>rb', ':call VimuxRunCommand("clear; rspec " . bufname("%"))<cr>', { noremap = true, silent = true })
