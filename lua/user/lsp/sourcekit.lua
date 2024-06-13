require'lspconfig'.sourcekit.setup{
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
  root_dir = function()
    for _, ext in ipairs({"buildServer.json", "*.xcodeproj", "*.xcworkspace", "compile_commands.json", "Package.swift", ".git"}) do
      local path = vim.fn.finddir(ext)
      if path then return vim.fs.dirname(path) end
    end
    return nil
  end,
}
