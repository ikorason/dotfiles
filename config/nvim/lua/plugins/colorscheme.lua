return {
  -- "rebelot/kanagawa.nvim",

  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("everforest").setup({
  --       italics = true,
  --       diagnostic_virtual_text = "grey",
  --       diagnostic_line_highlight = true,
  --       -- on_highlights = function(hl, palette)
  --       --   hl.TSDanger = {}
  --       -- end,
  --       -- on_highlights = function(hl, palette)
  --       --   hl.DiagnosticError = { fg = palette.none, bg = palette.none, sp = palette.red }
  --       --   hl.DiagnosticWarn = { fg = palette.none, bg = palette.none, sp = palette.yellow }
  --       --   hl.DiagnosticInfo = { fg = palette.none, bg = palette.none, sp = palette.blue }
  --       --   hl.DiagnosticHint = { fg = palette.none, bg = palette.none, sp = palette.green }
  --       -- end,
  --     })
  --   end,
  -- },

  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "moon",
  --       highlight_groups = {
  --         TelescopeBorder = { fg = "overlay", bg = "overlay" },
  --         TelescopeNormal = { fg = "subtle", bg = "overlay" },
  --         TelescopeSelection = { fg = "text", bg = "highlight_med" },
  --         TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
  --         TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
  --
  --         TelescopeTitle = { fg = "base", bg = "love" },
  --         TelescopePromptTitle = { fg = "base", bg = "pine" },
  --         TelescopePreviewTitle = { fg = "base", bg = "iris" },
  --
  --         TelescopePromptNormal = { fg = "text", bg = "surface" },
  --         TelescopePromptBorder = { fg = "surface", bg = "surface" },
  --       },
  --     })
  --   end,
  -- },

  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = "hard"
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
      -- colorscheme = "kanagawa",
      -- colorscheme = "rose-pine",
    },
  },
}
