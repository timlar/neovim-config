require('nvim-web-devicons').setup {
  variant = 'dark',
  override_by_filename = {
    ['gemfile'] = { icon = '', color = nil, name = 'Gemfile' },
    ['rakefile'] = { icon = '', color = nil, name = 'Rakefile' },
  },
  override_by_extension = {
    ['config.ru'] = { icon = '', color = nil, name = 'Configru' },
    ['gemspec'] = { icon = '', color = nil, name = 'Gemspec' },
    ['rake'] = { icon = '', color = nil, name = 'Rake' },
    ['rb'] = { icon = '', color = nil, name = 'Rb' },
  }
}
