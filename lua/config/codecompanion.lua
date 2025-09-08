require('codecompanion').setup({
  strategies = {
    chat = { adapter = 'openai' },
    inline = { adapter = 'openai' },
    cmd = { adapter = 'openai' },
  },
  adapters = {
    openai = function()
      return require('codecompanion.adapters').extend('openai', {
        env = {
          api_key = os.getenv('OPENAI_API_KEY'),
        },
        schema = {
          model = {
            default = 'gpt-5-nano',
          },
        },
      })
    end,
  },
})
