return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.install").install({ "python", "bash", "markdown", "fish" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python", "sh", "bash", "markdown", "fish" },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
