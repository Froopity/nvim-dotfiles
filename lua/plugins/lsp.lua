return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    -- 1. Setup Mason
    require("mason").setup()

    -- 2. Load local list
    local has_local, servers = pcall(require, "user.local_lsp")
    if not has_local then return end

    local server_configs = {
      pyright = {
        before_init = function(_, config)
          local p
          if vim.env.VIRTUAL_ENV then
            p = vim.env.VIRTUAL_ENV .. '/bin/python'
          else
            local venv = vim.fn.getcwd() .. '/.venv'
            if vim.fn.executable(venv .. '/bin/python') == 1 then
              p = venv .. '/bin/python'
            else
              p = 'python' -- fallback to system
            end
          end
          config.settings.python.pythonPath = p
        end,
      },
      -- You can add others here later, e.g., yamlls = { ... }
    }

    -- 3. Prepare common capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = cmp_lsp.default_capabilities(capabilities)
    end

    -- 4. Enable servers using the NEW Nvim 0.11+ native way
    for _, server_name in ipairs(servers) do
      -- This looks up the server definition in the nvim-lspconfig library
      -- and enables it via the Neovim built-in LSP manager
      vim.lsp.enable(server_name, {
        capabilities = capabilities,
        -- You can add further server-specific overrides here
      })
    end

    -- 5. Auto-install missing servers via Mason
    local registry = require("mason-registry")
    for _, server_name in ipairs(servers) do
      local ok, p = pcall(registry.get_package, server_name)
      if ok and not p:is_installed() then
        p:install()
      end
    end
  end,
}
