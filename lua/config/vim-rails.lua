vim.g.rails_projections = {
  ['app/graphql/mutations/*.rb'] = {
    command = 'mutation',
    test = 'spec/requests/mutations/{}_spec.rb',
    alternate = 'spec/requests/mutations/{}_spec.rb',
  },
  ['spec/requests/mutations/*_spec.rb'] = {
    alternate = 'app/graphql/mutations/{}.rb',
  },
  ['app/graphql/queries/*.rb'] = {
    command = 'query',
    test = 'spec/requests/queries/{}_spec.rb',
    alternate = 'spec/requests/queries/{}_spec.rb',
  },
  ['spec/requests/queries/*_spec.rb'] = {
    alternate = 'app/graphql/queries/{}.rb',
  },
}

vim.api.nvim_create_autocmd('FileType', { pattern = 'eruby.yaml', command = 'set filetype=yaml' })
