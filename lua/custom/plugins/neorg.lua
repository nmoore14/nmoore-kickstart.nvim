return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.integrations.treesitter"] = {
          config = {
            configure_parsers = true,
            intstall_parsers = true,
          },
        },
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          }
        },
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Desktop/_nick/org/notes",
              projects = "~/Desktop/_nick/org/projects",
              work = "~/Desktop/_nick/org/work",
            },
          },
        },
        ["core.keybinds"] = {},
        ["core.presenter"] = {
          config = {
             zen_mode = "zen-mode",
          },
        },
        ["core.qol.todo_items"] = {
          config = {
            create_todo_items = true,
            create_todo_parents = true,
          },
        },
        ["core.summary"] = {},
        ["core.ui.calendar"] = {}
      },
    }
  end,
}
