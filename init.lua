-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Disable virtual text for diagnostics (error messages on the right)
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

-- Neovide settings
vim.g.neovide_opacity = 0.85
vim.g.neovide_normal_opacity = 0.6  -- Blend colorscheme bg with desktop (lower = more transparent)
vim.g.neovide_window_blurred = true  -- Blur the background (macOS only)

-- Cursor animations
vim.g.neovide_cursor_vfx_mode = "pixiedust"  -- Options: railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_animation_length = 0.08  -- Snappier cursor movement
vim.g.neovide_cursor_trail_size = 0.7  -- Smoother trail (0.0-1.0)
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 0.8
vim.g.neovide_cursor_vfx_particle_density = 10.0
vim.g.neovide_cursor_vfx_particle_speed = 12.0

-- Scroll animations
vim.g.neovide_scroll_animation_length = 0.2  -- Smooth scrolling
vim.g.neovide_scroll_animation_far_lines = 9999  -- Animate all scroll distances
vim.g.neovide_position_animation_length = 0.1  -- Window split animations

-- Floating window effects
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_blur_amount_x = 3.0
vim.g.neovide_floating_blur_amount_y = 3.0
vim.g.neovide_floating_corner_radius = 0.3

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
