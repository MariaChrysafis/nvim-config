return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    -- Review PR: diff current branch against origin/main
    { "<leader>gpl", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "Review PR (vs main)" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = {
        layout = "diff2_horizontal",
      },
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
    file_panel = {
      win_config = {
        position = "left",
        width = 35,
      },
    },
  },
}
