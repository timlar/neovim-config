require('packer').init {
  display = {
    open_cmd = '80vnew [packer]',
    working_sym = '',
    error_sym = '',
    done_sym = '',
    removed_sym = '',
    moved_sym = '',
    header_sym = '—',
    keybindings = {
      quit = 'q',
      toggle_info = '<enter>',
      diff = 'd',
      prompt_revert = 'r',
    }
  }
}
