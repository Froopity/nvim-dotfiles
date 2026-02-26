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
        
        telescope.setup({
            defaults = {
                path_display = { "smart" },
                file_ignore_patterns = { ".git/" },
                mappings = {
                    i = {
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                    },
                },
            },
            pickers = {
              find_files = {
                hidden = true
              },
            },
        })

        -- Load the fzf extension for better sorting performance
        telescope.load_extension("fzf")

        -- Keymaps
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
}
