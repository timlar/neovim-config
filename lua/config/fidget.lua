local h = require('helpers')
local icons = h.icons.fidget

require('fidget').setup {
  progress = {
    display = {
      done_icon = icons.done,
    },
  },
}
