vim.g.ale_sign_error = ''
vim.g.ale_sign_warning = ''
vim.g.ale_set_highlights = 0

vim.g.ale_echo_msg_error_str = ''
vim.g.ale_echo_msg_warning_str = ''
vim.g.ale_echo_msg_format = ' %severity% [%linter%] %s'

vim.g.ale_linters = {
  ruby = { 'brakeman', 'rails_best_practices', 'rubocop', 'prettier' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  json = { 'eslint' },
  vue = { 'eslint' },
  css = { 'stylelint' },
  scss = { 'stylelint' },
  yaml = { 'yamllint' }
}

vim.b.ale_linters_ignore = { 'tsserver' }
vim.g.ale_disable_lsp = 1

vim.g.ale_ruby_rails_best_practices_options = '--config .rails_best_practices.yml --exclude "db"'

vim.g.ale_fixers = {
  ruby = { 'rubocop', 'prettier' },
  sql = { 'sqlint' },
  dockerfile = { 'hadolint' },
  markdown = { 'prettier' },
  json = { 'prettier' },
  yaml = { 'prettier', 'yamlint' },
  css = { 'prettier', 'stylelint' },
  scss = { 'prettier', 'stylelint' },
  javascript = { 'prettier', 'eslint' },
  typescript = { 'prettier', 'eslint' },
  vue = { 'prettier', 'eslint' }
}

vim.cmd [[
  augroup ALEHighlight
    hi ALEErrorSign ctermfg=1 ctermbg=10 guifg=#fb4934 guibg=#3c3836
    hi ALEWarningSign ctermfg=3 ctermbg=10 guifg=#fabd2f guibg=#3c3836
  augroup END 
]]

vim.api.nvim_set_keymap('', '<C-k>', '<Plug>(ale_previous_wrap)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-j>', '<Plug>(ale_next_wrap)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<f12>', '<Plug>(ale_fix)', { noremap = true, silent = true })

vim.cmd 'ALEEnable'
