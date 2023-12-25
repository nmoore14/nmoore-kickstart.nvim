return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function ()
    require('toggleterm').setup{
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = vim.api.nvim_win_get_width(0) - 10,
        height = vim.api.nvim_win_get_height(0) - 40,
        winblend = 0,
        zindex = 100
      }
    }
  end
}
