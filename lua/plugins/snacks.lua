return {
  "folke/snacks.nvim",
  opts = {
    scratch = { enabled = true }
  },
  keys = {
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratchpad" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratchpad" },
  }
}
