return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      { "hrsh7th/nvim-cmp" },
      {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
          local function codepilot()
            local icon = require("utils.defaults").icons.kinds.Copilot
            return icon
          end

          -- local function fgcolor(name)
          --   local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name, link = false })
          --   local fg = hl and (hl.fg or hl.foreground)
          --   return fg and { fg = string.format("#%06x", fg) } or nil
          -- end

          local colors = {
            [""] = "Special",
            ["Normal"] = require("utils.colors").fgcolor("Special"),
            ["Warning"] = require("utils.colors").fgcolor("DiagnosticError"),
            ["InProgress"] = require("utils.colors").fgcolor("DiagnosticWarn"),
          }

          opts.copilot = {
            lualine_component = {
              codepilot,
              color = function()
                if not package.loaded["copilot"] then
                  return
                end
                local status = require("copilot.api").status.data
                return colors[status.status] or colors[""]
              end,
            },
          }
        end,
      },
    },
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
          },
        },
      })

      -- hide copilot suggestions when cmp menu is open
      -- to prevent odd behavior/garbled up suggestions
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on("menu_closed", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      end
    end,
    keys = require("config.keymaps").setup_copilot_keymaps(),
  },
}
