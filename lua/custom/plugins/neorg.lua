 return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.completion"] = {},
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Desktop/_nick/org/notes",
                projects = "~/Desktop/_nick/org/projects",
                work = "~/Desktop/_nick/org/work",
              },
            },
           ["core.presenter"] = {},
           ["core.summary"] = {},
           ["core.ui.calendar"] = {}
          },
        },
      }
    end,
  }
