return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
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
        },
      },
    },
  },
}