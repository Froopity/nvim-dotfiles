return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff", lsp_format = "fallback" },
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
    })
  end
}
