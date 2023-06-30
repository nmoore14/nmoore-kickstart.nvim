return {
  'adisen99/codeschool.nvim',
  dependencies = {'rktjmp/lush.nvim'},
  config = function()
    require('lush')(require('codeschool').setup({
      plugins = {
        'cmp',
        'gitsigns',
        'lsp',
        'nvimtree',
        'telescope',
        'treesitter'
      },
      langs = {
        "c",
        "clojure",
        "coffeescript",
        "csharp",
        "css",
        "elixir",
        "golang",
        "haskell",
        "html",
        "java",
        "js",
        "json",
        "jsx",
        "lua",
        "markdown",
        "moonscript",
        "objc",
        "ocaml",
        "purescript",
        "python",
        "ruby",
        "rust",
        "scala",
        "typescript",
        "viml",
        "xml"
      }
    }))
    vim.g.codeschool_transparent_bg = 1
    vim.g.codeschool_italic = 1
    vim.g.codeschool_contrast_dark = 'medium'
    vim.g.codeschool_contrast_light = 'soft'
    vim.cmd.colorscheme 'codeschool'
  end,
}
