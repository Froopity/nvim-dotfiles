return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when a file is opened
  opts = {
    -- add any custom options here
  },
  config = function(_, opts)
    local persistence = require("persistence")
    persistence.setup(opts)

    -- Auto-restore last session only if Neovim is opened without arguments
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("persistence_auto_load", { clear = true }),
      callback = function()
        -- Only load if:
        -- 1. No files were passed as arguments (argc == 0)
        -- 2. We aren't reading from stdin (e.g., echo "test" | nvim)
        if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
          persistence.load()
        end
      end,
    })
  end,
  keys = {
    -- Quick manual controls
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
}
