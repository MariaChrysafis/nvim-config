-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Disable virtual text for diagnostics (error messages on the right)
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

-- Neovide settings
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animation_length = 0.1

-- Neovide scaling keymaps
if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

-- Fixed socket for neovim-remote (nvr) integration
pcall(vim.fn.delete, '/tmp/nvimsocket')
vim.fn.serverstart('/tmp/nvimsocket')
