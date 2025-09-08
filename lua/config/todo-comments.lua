local tc = require('todo-comments')
local h = require('helpers')
local map = vim.keymap.set
local icons = h.icons.todo_comments

tc.setup({
  highlight = {
    multiline = false,
  },
  keywords = {
    FIX  = { icon = icons.error, color = 'error', alt = { 'FIXME', 'BUG', 'ISSUE' } },
    HACK = { icon = icons.hack, color = 'warning' },
    NOTE = { icon = icons.hint, color = 'hint', alt = { 'INFO' } },
    TEST = { icon = icons.test, color = 'test', alt = { 'SPEC' } },
    TODO = { icon = icons.todo, color = 'info' },
    WARN = { icon = icons.warn, color = 'warning', alt = { 'WARNING', 'XXX' } },
  },
  colors = {
    error   = { 'GruvboxRed' },
    warning = { 'GruvboxYellow' },
    info    = { 'GruvboxPurple' },
    hint    = { 'GruvboxBlue' },
    default = { 'GruvboxBlue' },
    test    = { 'GruvboxOrange' }
  },
})

-- TodoTelescope keywords=TODO,FIX

map('n', '<leader>ta', '<cmd>TodoTelescope<cr>', { desc = 'Todo Comments: Show all comments' })
map('n', '<leader>tt', '<cmd>TodoTelescope keywords=TODO<cr>', { desc = 'Todo Comments: Show TODO only' })
map('n', '<leader>tf', '<cmd>TodoTelescope keywords=FIXME<cr>', { desc = 'Todo Comments: Show FIXME only' })
map('n', '<leader>ts', '<cmd>TodoTelescope keywords=TEXT,SPEC<cr>', { desc = 'Todo Comments: Show TEST and SPEC' })
map('n', ']t', tc.jump_next, { desc = 'Todo Comments: Next todo comment' })
map('n', '[t', tc.jump_prev, { desc = 'Todo Comments: Previous todo comment' })
