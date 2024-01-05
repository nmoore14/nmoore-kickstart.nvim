return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        mappings = {
          ["C"] = "close_all_subnodes",
          ["Z"] = "expand_all_nodes",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_current",
      },
    })
  end,
  branch = "v3.x",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
