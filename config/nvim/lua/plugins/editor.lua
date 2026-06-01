return {
  {
    enabled = false,
    "folke/flash.nvim",
  },

  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        symbols = {
          win = {
            size = 60, -- columns; use a fraction like 0.4 for a percentage of screen width
          },
        },
      },
    },
  },

  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Open file/folder in git repository
        browse = "<Leader>go",
      },
    },
  },
}
