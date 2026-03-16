return {
  "nvim-mini/mini.surround",
  version = false,
  config = function()

    require('mini.surround').setup({
      custom_surroundings = {
        -- Invert brackets: ( for no space, ) for space
        ['('] = { output = { left = '(', right = ')' } },
        [')'] = { output = { left = '( ', right = ' )' } },
        ['['] = { output = { left = '[', right = ']' } },
        [']'] = { output = { left = '[ ', right = ' ]' } },
        ['{'] = { output = { left = '{', right = '}' } },
        ['}'] = { output = { left = '{ ', right = ' }' } },
      }
    })
    vim.keymap.set('n', '<leader>s', 'saiw', { remap = true, desc = 'Surround word' })
  end
}
