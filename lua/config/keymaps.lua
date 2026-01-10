-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Ctrl+R to run cargo in a vertical split terminal (in current file's directory)
vim.keymap.set("n", "<C-r>", function()
  -- Close existing cargo terminal if any
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match("cargo") then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
  -- Find directory containing Cargo.toml
  local dir = vim.fn.expand("%:p:h")
  while dir ~= "/" do
    if vim.fn.filereadable(dir .. "/Cargo.toml") == 1 then
      break
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  vim.cmd("vsplit | terminal cd " .. dir .. " && cargo run --release")
end, { desc = "Run cargo" })

-- gl for diagnostics (full error), K for hover (type info)
vim.keymap.set('n', 'gl', function()
  vim.diagnostic.open_float({
    border = "rounded",
    max_width = 80,
    source = true,
    scope = "line",
  })
end, { desc = "Show line diagnostics" })

-- Code actions (accept LSP suggestions like auto-imports)
-- Single keystroke: Ctrl+. (like VS Code)
vim.keymap.set('n', '<C-.>', function()
  if vim.bo.filetype == "rust" then
    vim.cmd.RustLsp('codeAction')
  else
    vim.lsp.buf.code_action()
  end
end, { desc = "Code action" })

-- Also bind to <leader>ca for consistency
vim.keymap.set('n', '<leader>ca', function()
  if vim.bo.filetype == "rust" then
    vim.cmd.RustLsp('codeAction')
  else
    vim.lsp.buf.code_action()
  end
end, { desc = "Code action" })

-- Quick fix: apply preferred/first code action automatically
vim.keymap.set('n', '<leader>qf', function()
  vim.lsp.buf.code_action({
    filter = function(action) return action.isPreferred end,
    apply = true,
  })
end, { desc = "Quick fix" })

-- LSP Rename
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Double-click to find all references (like most IDEs)
vim.keymap.set('n', '<2-LeftMouse>', vim.lsp.buf.references, { desc = "Find references" })

-- Telescope
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = "Live grep" })
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = "Find files" })

-- Grep in Neo-tree directory
vim.keymap.set('n', '<leader>sn', function()
  local ok, manager = pcall(require, 'neo-tree.sources.manager')
  if ok then
    local state = manager.get_state('filesystem')
    local tree = state and state.tree
    local node = tree and tree:get_node()
    if node then
      local path = node:get_id()
      if node.type == 'file' then
        path = vim.fn.fnamemodify(path, ':h')
      end
      vim.notify('Grepping in: ' .. path)
      require('telescope.builtin').live_grep({ cwd = path })
      return
    end
  end
  require('telescope.builtin').live_grep()
end, { desc = 'Grep in Neo-tree directory' })

-- Toggle terminal at bottom
vim.keymap.set('n', '<C-`>', function()
  vim.cmd('botright 15split | terminal')
end, { desc = 'Open terminal at bottom' })
vim.keymap.set('t', '<C-`>', '<C-\\><C-n>:q<CR>', { desc = 'Close terminal' })