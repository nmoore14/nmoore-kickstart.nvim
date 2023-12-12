return {
  "mfussenegger/nvim-dap",
  "jay-babu/mason-nvim-dap.nvim",
  config = function ()
    require("mason-nvim-dap").setup({
      ensure_installed = {},
      automatic_installation = false
    })
  end
}
