return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      styles = {
        comments = { "italic" },
      },
      integrations = {
        telescope = true,
        neo_tree = true,
        treesitter = true,
        native_lsp = { enabled = true },
      },
    })
    vim.cmd("colorscheme catppuccin")
  end,
}
