return {
  'ThePrimeagen/harpoon',
  config = function ()
    require('harpoon').setup({
      menu = {
        widht = vim.api.nvim_win_get_width(0) - 4,
      }
    })
  end
}
