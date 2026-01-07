return {
  'cockytrumpet/yt_audio.nvim',
  cmd = { 'YAPlay', 'YAStop' },
  keys = {
    { '<leader>yp', ':YAPlay<CR>', desc = 'YT Audio Play' },
    { '<leader>ys', ':YAStop<CR>', desc = 'YT Audio Stop' },
  },
  opts = {},
}
