local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map('', '<leader>sj', ':SplitjoinJoin<cr>', opts)
map('', '<leader>ss', ':SplitjoinSplit<cr>', opts)
