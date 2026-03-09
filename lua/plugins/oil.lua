return {
  'stevearc/oil.nvim',
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
    },
    columns = {
      "icons",
      "mtime",
    },
    skip_confirm_for_simple_edits = true,
  },
  keys = {
    { "<leader>o", "<CMD>Oil<CR>", desc = "Open Oil" },
  },
}
