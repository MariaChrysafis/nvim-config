-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")



-- Show diagnostics (short inline, use gl for full error)
vim.diagnostic.config({
  virtual_text = { spacing = 4, prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  float = { border = "rounded" },
})

-- Enable inlay hints when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Open neo-tree when first file is opened (after dashboard)
local neotree_opened = false
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    if neotree_opened then return end
    local ft = vim.bo.filetype
    if ft ~= "" and ft ~= "snacks_dashboard" and ft ~= "neo-tree" and ft ~= "lazy" then
      neotree_opened = true
      vim.defer_fn(function()
        vim.cmd("Neotree show")
        vim.cmd("wincmd l")
      end, 50)
    end
  end,
})
