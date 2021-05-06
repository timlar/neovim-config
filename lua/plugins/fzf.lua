vim.o.rtp = vim.o.rtp..'/usr/local/opt/fzf'

vim.api.nvim_set_keymap('', '<f4>', ':Files<cr>', { noremap = true, silent = true })
