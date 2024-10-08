local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map('', '<f3>', ':NvimTreeToggle<cr>', opts)
map('', '<f4>', ':NvimTreeFindFile<cr>', opts)

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
    width = 40,
    side = 'left',
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
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
      git_placement = 'before',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
        default = '', --   
        symlink = '',
        bookmark = '', --   
        folder = {
          arrow_closed = '', --   
          arrow_open = '', --   
          default = '',
          open = '',
          empty = '', -- 
          empty_open = '', -- 
          symlink = '', -- 
          symlink_open = '' -- 
        },
        git = {
          unstaged = '', -- •
          staged = '',
          unmerged = '',
          renamed = '➜',
          untracked = '',
          deleted = '', --  
          ignored = '',
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
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {
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

local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1
  local real_file = vim.fn.filereadable(data.file) == 1
  local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

  if real_file and not no_name then
    return
  end

  if directory then
    vim.cmd.cd(data.file)
  end

  require('nvim-tree.api').tree.toggle({ focus = true, find_file = true })
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
