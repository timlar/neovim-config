local api = require('nvim-tree.api')
local h = require('helpers')
local map = vim.keymap.set
-- local autocmd = vim.api.nvim_create_autocmd
local icons = h.icons.nerd_tree

require('nvim-tree').setup {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  ignore_buf_on_tab_change = {},
  sort_by = 'case_sensitive', -- 'name',
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = "disable",
  select_prompts = false,
  view = {
    adaptive_size = false,
    centralize_selection = false,
    side = 'left',
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = 'no',
    width = 40,
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = 'all',
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = '╰', -- └
        edge = '│',
        item = '│',
        bottom = "─",
        none = ' ',
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = 'after',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
        default = icons.default,
        symlink = icons.symlink,
        bookmark = icons.bookmark,
        folder = {
          arrow_closed = icons.folder.arrow_closed,
          arrow_open = icons.folder.arrow_open,
          default = icons.folder.default,
          open = icons.folder.open,
          empty = icons.folder.empty,
          empty_open = icons.folder.empty_open,
          symlink = icons.folder.symlink,
          symlink_open = icons.folder.symlink_open,
        },
        git = {
          unstaged = icons.git.unstaged,
          staged = icons.git.staged,
          unmerged = icons.git.unmerged,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          deleted = icons.git.deleted,
          ignored = icons.git.ignored,
        },
      },
    },
    special_files = {},
    symlink_destination = true,
  },
  hijack_directories = {
    enable = false,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    debounce_delay = 15,
    update_root = false,
    ignore_list = {},
  },
  system_open = {
    cmd = '',
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      error = h.icons.error,
      warning = h.icons.warn,
      hint = h.icons.hint,
      info = h.icons.info,
    },
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = {
      '^.git$',
      'node_modules',
    },
    exclude = {
      '.env',
      'database.yml',
      '.key'
    },
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {
      '.git',
      'node_modules',
    },
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        picker = "default",
        chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        exclude = {
          filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = 'gio trash',
    require_confirm = true,
  },
  live_filter = {
    prefix = '[FILTER]: ',
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}

-- local function open_nvim_tree(data)
--   local directory = vim.fn.isdirectory(data.file) == 1
--   local real_file = vim.fn.filereadable(data.file) == 1
--   local no_name = data.file == '' and vim.bo[data.buf].buftype == ''
--
--   if real_file and not no_name then
--     return
--   end
--
--   if directory then
--     vim.cmd.cd(data.file)
--   end
--
--   api.tree.open({ focus = true, find_file = true })
-- end

-- local function collapse_to_root()
--   local node = api.tree.get_node_under_cursor()
--
--   while node and node.parent do
--     api.node.collapse(node)
--     node = node.parent
--   end
-- end

local function collapse_current()
  local node = api.tree.get_node_under_cursor()

  if node then
    if node.type == 'directory' and node.open then
      api.node.collapse(node)
    elseif node.parent then
      api.node.collapse(node.parent)
    end
  end
end

-- autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

map('n', '<f3>', '<cmd>NvimTreeToggle<cr>', { desc = 'NvimTree: Toggle' })
map('n', '<f4>', '<cmd>NvimTreeFindFile<cr>', { desc = 'NvimTree: Find Current File' })
map('n', 'w', collapse_current, { desc = 'NvimTree: Collapse Current Node' })

local view_width = require('nvim-tree').config.view.width

vim.keymap.set('n', '<leader><f3>', function()
  view_width = (view_width == 40) and 60 or 40
  vim.cmd('NvimTreeResize ' .. view_width)
end, { desc = 'Toggle NvimTree width' })
