require('mini.ai').setup()

require('mini.align').setup()

require('mini.splitjoin').setup({
  join = {
    hooks_post = {
      function()
        local line = vim.api.nvim_get_current_line()

        line = line:gsub('{%s*', '{ ') -- add space after {
        line = line:gsub('%s*}', ' }') -- add space before }

        vim.api.nvim_set_current_line(line)
      end
    }
  }
})

require('mini.surround').setup({
  mappings = {
    add = 'cS',
    delete = 'ds',
    find = '',
    find_left = '',
    highlight = '',
    replace = 'cs',
    update_n_lines = '',
    suffix_last = '',
    suffix_next = '',
  },
  search_method = 'cover_or_next',
  n_lines = 1,
})
