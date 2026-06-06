-- Python language server configuration
return {
  "pyrefly",
  lsp = {
    cmd = { "pyrefly", "lsp" },
    filetypes = { "python" },
    single_file_support = true,
  },
}
