return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "BufReadPost",
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { "lsp", "indent" }
    end,
  },
  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function(_, opts)
    require("ufo").setup(opts)

    -- Standard fold keymaps
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
    vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds with" })

    -- Ctrl+F to toggle fold under cursor
    vim.keymap.set("n", "<C-f>", "za", { desc = "Toggle fold" })

    -- K to peek fold or show hover
    vim.keymap.set("n", "K", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek fold or hover" })
  end,
}
