return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      }

      local cwd = vim.fn.getcwd()
      if cwd:match("Exafunction") then
        opts.servers.gopls = {
          settings = {
            gopls = {
              env = {
                GOPACKAGESDRIVER = "/Users/mariachrysafis/Documents/Exafunction/tools/gopackagesdriver.sh",
              },
              directoryFilters = {
                "-bazel-bin",
                "-bazel-out",
                "-bazel-testlogs",
                "-bazel-Exafunction",
              },
            },
          },
        }
      end
    end,
  },
}
