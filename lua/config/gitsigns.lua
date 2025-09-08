local h = require('helpers')
local map = vim.keymap.set
local icons = h.icons.gitsigns

require('gitsigns').setup {
  signs = {
    add          = { text = icons.add },
    change       = { text = icons.change },
    delete       = { text = icons.delete },
    topdelete    = { text = icons.topdelete },
    changedelete = { text = icons.changedelete },
    untracked    = { text = icons.untracked },
  },
  signs_staged = {
    add          = { text = icons.add },
    change       = { text = icons.change },
    delete       = { text = icons.delete },
    topdelete    = { text = icons.topdelete },
    changedelete = { text = icons.changedelete },
    untracked    = { text = icons.untracked },
  },
  signs_staged_enable = true,
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 5000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 200,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

local toggle_gitsigns_blame = function()
  -- find any buffers with filetype=gitsigns-blame
  local blame_bufs = vim.tbl_filter(function(b)
    return b.loaded == 1 and vim.bo[b.bufnr].filetype == 'gitsigns-blame'
  end, vim.fn.getbufinfo())

  if #blame_bufs > 0 then
    for _, b in ipairs(blame_bufs) do
      -- close all windows showing this buffer
      for _, win in ipairs(vim.fn.win_findbuf(b.bufnr)) do
        pcall(vim.api.nvim_win_close, win, true)
      end
      -- if buffer no longer visible, delete it
      if #vim.fn.win_findbuf(b.bufnr) == 0 then
        pcall(vim.api.nvim_buf_delete, b.bufnr, { force = true })
      end
    end
  else
    vim.cmd('Gitsigns blame')
  end
end

vim.keymap.set('n', '<leader>gb', toggle_gitsigns_blame, { desc = 'Toggle Gitsigns file blame' })
