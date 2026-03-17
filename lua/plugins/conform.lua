return {
  'stevearc/conform.nvim',
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff" },
      fish = { "fish_indent" },
      html = { "html_beautify" },
      markdown = { "markdownfmt" },
      bash = { "shellcheck" },
      yaml = { "yamlfix" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback"
    }
  },
}
