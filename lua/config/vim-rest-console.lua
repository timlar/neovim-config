vim.g.vrc_trigger = '<f5>'
vim.g.vrc_auto_format_response_patterns = { json = 'python3 -m json.tool' }
vim.g.vrc_auto_format_uhex = 1
vim.g.vrc_output_buffer_name = 'response.json'

vim.g.vrc_curl_opts = {
  ['--connect-timeout'] = 10,
  ['-b'] = vim.fn.stdpath('config') .. '/tmp/cookie',
  ['-c'] = vim.fn.stdpath('config') .. '/tmp/cookie',
  ['-L'] = '',
  ['-i'] = '',
  ['-s'] = '',
  ['-k'] = '',
  ['--max-time'] = '60',
  ['--ipv4'] = ''
}
