return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      style_preset = require("bufferline").style_preset.default,
      themable = true,
      numbers = "none",
      close_command = "bdelete! %d",
      indicator = {
        icon = "▎",
        style = "icon",
      },
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 40,
      max_prefix_length = 20,
      truncate_names = true,
      tab_size = 24,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      separator_style = "slant",
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close unpinned" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
    { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to right" },
    { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to left" },
  },
}
