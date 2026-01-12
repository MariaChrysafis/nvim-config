return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        autoshow = true,
        width = 60,
        sections = {
          { section = "header" },
          {
            text = os.date("%A, %B %d, %Y") .. "  " .. os.date("%I:%M %p"),
            align = "center",
            hl = "SnacksDashboardHeader",
            padding = 1,
          },
          {
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 2,
            padding = { 1, 1 },
          },
          { section = "startup" },
        },
      },
    },
  },
}
