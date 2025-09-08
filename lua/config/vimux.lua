local map = vim.keymap.set

map('n', '<leader>rr', '<cmd>VimuxPromptCommand<cr>', { desc = 'Vimux: Prompt command' })
map('n', '<leader>rl', '<cmd>VimuxRunLastCommand<cr>', { desc = 'Vimux: Run last command' })
map('n', '<leader>rc', '<cmd>VimuxCloseRunner<cr>', { desc = 'Vimux: Close runner' })
map('n', '<leader>ri', '<cmd>VimuxInterruptRunner<cr>', { desc = 'Vimux: Interrupt runner' })
map('n', '<leader>rz', '<cmd>VimuxZoomRunner<cr>', { desc = 'Vimux: Zoom runner' })
map('n', '<leader>rb', '<cmd>call VimuxRunCommand("clear; rspec " . bufname("%"))<cr>', { desc = 'Vimux: Run RSpec' })

vim.g.VimuxHeight = 40
vim.g.VimuxOrientation = 'v'
vim.g.VimuxPromptString = '> '
