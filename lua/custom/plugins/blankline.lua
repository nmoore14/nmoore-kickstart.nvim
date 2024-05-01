return { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  config = function ()
    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"

    local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E9989E" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#ECD2A2" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#A0CFF5" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#E3C2A3" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#CBE1BC" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#E2BBEE" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#BBE1E6" })
    end)
    require("ibl").setup {
      indent = {
        highlight = highlight,
        tab_char = "│"
      },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = true
      },
      scope = {
        enabled = true,
      },
    }
  end
}
