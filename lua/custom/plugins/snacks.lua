return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = {
      enabled = true,
      notify = true,
      size = 1.5 * 1024 * 1024,
    },
    indent = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scratch = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle the scratch buffer',
    },
    {
      '<leader>l',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
  },
}
