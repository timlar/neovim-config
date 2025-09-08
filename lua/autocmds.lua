local autocmd = vim.api.nvim_create_autocmd
local user_group = vim.api.nvim_create_augroup('UserGroup', { clear = true })

autocmd('BufWinEnter', {
  group = user_group,
  pattern = '*',
  desc = 'Remember last cursor position',
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") and vim.bo.filetype ~= 'commit' then
      vim.cmd('normal! g`"zvzz')
    end
  end,
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  group = user_group,
  pattern = '*',
  desc = 'Set maximum width of text that is being formatted by <gw> in visual mode',
  callback = function()
    vim.bo.textwidth = 120
  end
})

-- autocmd('VimEnter', {
--   group = user_group,
--   pattern = '*',
--   desc = 'Change the working dir to the folder where the current file is located',
--   command = 'silent! lcd %:p:h',
-- })

-- autocmd('TextYankPost', {
--   group = user_group,
--   pattern = '*',
--   desc = 'Highlights text that has been copied to the clipboard'
--   callback = function()
--     vim.highlight.on_yank()
--   end
-- })

autocmd('FileType', {
  group = user_group,
  pattern = 'qf',
  callback = function()
    vim.cmd [[nnoremap <silent> <buffer> <CR> <CR>:cclose<CR>]]
  end
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  group = user_group,
  pattern = {
    '.env',
    '.env.*',
  },
  command = 'set filetype=sh',
  desc = 'Forces the file type to `sh` for the `.env.*` files',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  group = user_group,
  pattern = '*.vue',
  command = 'set filetype=vue',
  desc = 'Forces the file type to `vue` for files with the `.vue` extension',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  group = user_group,
  pattern = {
    'docker-compose.yml',
    'docker-compose.yaml',
    'docker-compose.*.yml',
    'docker-compose.*.yaml',
    'compose.yml',
    'compose.yaml',
  },
  command = 'set filetype=yaml.docker-compose',
  desc = 'Forces the file type to `yaml.docker-compose` for docker-compose files',
})
