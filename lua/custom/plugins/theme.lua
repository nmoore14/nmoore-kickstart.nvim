return {
  'Shatur/neovim-ayu',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('ayu').setup {
      mirage = true,
      terminal = false,
      overrides = {},
    }
    vim.cmd.colorscheme 'ayu'
  end,
}
