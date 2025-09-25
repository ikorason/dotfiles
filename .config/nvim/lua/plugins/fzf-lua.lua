return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional but nice
  cmd = "FzfLua",
  config = function()
    local fzf = require("fzf-lua")

    require("fzf-lua").setup({
      files = {
        cwd_prompt = false,
        formatter = "path.filename_first",
      },

      winopts = {
        backdrop = 100,
        height = 0.85,
        width = 0.85,

        preview = {
          scrollbar = "border",
          vertical = "up:65%",
        },
      },
    })

    -- File picker with new file creation
    vim.keymap.set("n", "sf", function()
      local dir = vim.fn.expand("%:p:h")
      if dir == "" then
        dir = vim.fn.getcwd()
      end

      require("fzf-lua").files({
        cwd = dir,
        winopts = {
          title = "Files in: " .. vim.fn.fnamemodify(dir, ":~") .. " (Ctrl+N: create new)",
        },
        fzf_opts = {
          ["--bind"] = "ctrl-n:execute-silent(echo create-new-file)+abort",
        },
        actions = {
          ["ctrl-n"] = function()
            local input = vim.fn.input("Create new file: " .. dir .. "/")
            if input and input ~= "" then
              local full_path = dir .. "/" .. input
              local file_dir = vim.fn.fnamemodify(full_path, ":h")
              if vim.fn.isdirectory(file_dir) == 0 then
                vim.fn.mkdir(file_dir, "p")
              end
              vim.cmd("edit " .. vim.fn.fnameescape(full_path))
              vim.cmd("write")
              print("Created new file: " .. full_path)
            end
          end,
        },
      })
    end, { desc = "FZF current directory with file creation" })

    -- LSP
    vim.keymap.set("n", "<leader>fd", fzf.lsp_definitions, { silent = true, desc = "FZF LSP Definitions" })
  end,
}
