-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Fixed socket for neovim-remote (nvr) integration
pcall(vim.fn.delete, '/tmp/nvimsocket')
vim.fn.serverstart('/tmp/nvimsocket')
