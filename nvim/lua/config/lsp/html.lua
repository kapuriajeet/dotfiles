return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "htmldjango" },
  init_options = {
    provideFormatter = true,
  },
}
