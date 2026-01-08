return {
  -- Import LazyVim's Go extras (includes gopls, gofumpt, goimports, golangci-lint)
  { import = "lazyvim.plugins.extras.lang.go" },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Get the default gopls config from LazyVim
      local gopls_config = opts.servers.gopls or {}

      -- Store the old on_new_config if it exists
      local old_on_new_config = gopls_config.on_new_config

      -- Add our own on_new_config handler
      gopls_config.on_new_config = function(new_config, root_dir)
        -- Call the old handler if it exists
        if old_on_new_config then
          old_on_new_config(new_config, root_dir)
        end

        -- Ensure gopls settings exist
        if not new_config.settings then
          new_config.settings = {}
        end
        if not new_config.settings.gopls then
          new_config.settings.gopls = {}
        end

        -- Add Bazel directory filters
        new_config.settings.gopls.directoryFilters = {
          "-bazel-bin",
          "-bazel-out",
          "-bazel-testlogs",
          "-bazel-LOMP",
        }
      end

      opts.servers.gopls = gopls_config
    end,
  },
}
