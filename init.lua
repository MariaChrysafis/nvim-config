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

  -- Cmd+C and Cmd+V for copy/paste (all modes)
  vim.keymap.set('v', '<D-c>', '"+y')         -- Copy in visual mode
  vim.keymap.set('n', '<D-v>', '"+P')         -- Paste in normal mode
  vim.keymap.set('v', '<D-v>', '"+P')         -- Paste in visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste in command mode
  vim.keymap.set('i', '<D-v>', '<C-R>+')      -- Paste in insert mode
end

-- Fixed socket for neovim-remote (nvr) integration
pcall(vim.fn.delete, '/tmp/nvimsocket')
vim.fn.serverstart('/tmp/nvimsocket')
