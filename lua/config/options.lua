-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Auto-save
vim.opt.autowriteall = true
vim.opt.updatetime = 300

-- Clipboard
vim.opt.clipboard = "unnamed"

-- Text wrapping
vim.opt.wrap = true
vim.opt.linebreak = true  -- Wrap at word boundaries, not mid-word

-- Enable inlay hints (type annotations)
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

-- Bazel Go packages driver for gopls (uncomment if needed)
-- vim.env.GOPACKAGESDRIVER = "/Users/mariachrysafis/Documents/Exafunction/tools/gopackagesdriver.sh"
