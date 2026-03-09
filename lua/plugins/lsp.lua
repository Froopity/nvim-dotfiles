return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    -- 1. Setup Mason
    require("mason").setup()

    -- 2. IMPORTANT: Prepend Mason's bin directory to the PATH
    -- This ensures 'vim.lsp.enable' can actually find the executables
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
    vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

    -- 3. Load local list
    local has_local, servers = pcall(require, "user.local_lsp")
    if not has_local then return end

    -- 4. Prepare capabilities (using the new native-friendly way)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = cmp_lsp.default_capabilities(capabilities)
    end

    -- 5. Define server-specific overrides
    local server_configs = {
      pyright = {
        settings = {
          python = {
            analysis = { autoSearchPaths = true },
          },
        },
        on_init = function(client)
          local venv = vim.fn.getcwd() .. '/.venv'
          if vim.env.VIRTUAL_ENV then
            client.config.settings.python.pythonPath = vim.env.VIRTUAL_ENV .. '/bin/python'
          elseif vim.fn.executable(venv .. '/bin/python') == 1 then
            client.config.settings.python.pythonPath = venv .. '/bin/python'
          end
        end,
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              -- This tells lua_ls that 'vim' is a valid global variable
              globals = { "vim" },
            },
            workspace = {
              -- This makes the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
          },
        },
      },
    }

    -- 6. Enable servers using the 0.11+ Native Way
    for _, server_name in ipairs(servers) do
      local config = server_configs[server_name] or {}

      -- Merge your base capabilities into the specific server config
      config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})

      -- 0.11 Way: Set the configuration for the server first
      vim.lsp.config(server_name, config)

      -- Then enable it
      local ok, err = pcall(vim.lsp.enable, server_name)

      if not ok then
        vim.notify("LSP Config Error for " .. server_name .. ": " .. err, vim.log.levels.ERROR)
      end
    end

    -- 7. Auto-install logic (Mason Registry)
    local registry = require("mason-registry")
    registry.refresh(function() -- Ensure registry is fresh
      for _, server_name in ipairs(servers) do
        local ok, p = pcall(registry.get_package, server_name)
        if ok and not p:is_installed() then
          p:install()
        end
      end
    end)
  end,
}
