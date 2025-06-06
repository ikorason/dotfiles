return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diagnostics" },
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_x = { "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = { "neo-tree", "lazy", "mason", "man", "nvim-dap-ui", "trouble" },
  },
  config = function(_, opts)
    -- TODO: make more generic insertion function which can insert anywhere.
    if opts.copilot then
      table.insert(opts.sections.lualine_x, 1, opts.copilot.lualine_component)
    end

    if opts.dap_status then
      table.insert(opts.sections.lualine_x, 2, opts.dap_status.lualine_component)
    end

    if opts.noice then
      table.insert(opts.sections.lualine_x, 3, opts.noice.lualine_component)
    end

    require("lualine").setup(opts)
  end,
}
