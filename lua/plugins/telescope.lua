return {
  'nvim-telescope/telescope.nvim',
  version = '*', -- Recommended for Neovim 0.11+ compatibility
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons', -- Optional: for file icons
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        path_display = { "smart" },
        file_ignore_patterns = { "%.git/" }, -- Use %. to escape the dot in Lua patterns
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-h>"] = actions.preview_scrolling_left,
            ["<C-l>"] = actions.preview_scrolling_right,
            ["<C-d>"] = actions.delete_buffer,
            ["<esc>"] = actions.close,
          },
          n = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-h>"] = actions.preview_scrolling_left,
            ["<C-l>"] = actions.preview_scrolling_right,
            ["<C-d>"] = actions.delete_buffer,
          },
        },
      },
      pickers = {
        find_files = {
          no_ignore = true,
          hidden = true,
          follow = true,
        },
        live_grep = {
          additional_args = function()
            return { "--unrestricted", "--follow" } -- Required for live_grep to see ignored files
          end
        },
        buffers = {
          initial_mode = "normal",
        },
        diagnostics = {
          initial_mode = "normal",
        },
      },
      extensions = {
        ["zoxide"] = {}
      }
    })

    local function telescope_snacks_scratch()
      require('telescope.builtin').find_files({
        prompt_title = "Snacks Scratch Buffers",
        cwd = vim.fn.stdpath("data") .. "/snacks/scratch",
        attach_mappings = function(_)
          return true
        end,
      })
    end

    -- Load the fzf extension for better sorting performance
    telescope.load_extension("fzf")

    -- Keymaps
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fG', builtin.current_buffer_fuzzy_find, { desc = 'Telescope live buffer fuzzy' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files({ cwd = vim.fn.expand('~/.config/nvim') })
    end, { desc = 'Telescope find nvim files' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
    vim.keymap.set("n", "<leader>fs", telescope_snacks_scratch, { desc = "Telescope Snacks Scratch" })
    vim.keymap.set('n', '<leader>flr', builtin.lsp_references, { desc = 'Telescope LSP references' })
    vim.keymap.set('n', '<leader>fls', builtin.lsp_document_symbols, { desc = 'Telescope document symbols' })
  end
}
