M = {}

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jump list
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "C-w>>")
keymap.set("n", "<C-w><up>", "C-w>+")
keymap.set("n", "<C-w><down>", "C-w>-")

keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>]], { desc = "Replace word under cursor" })

-- Files in current buffer's directory, with Ctrl+N to create a new file
keymap.set("n", "sf", function()
  local dir = vim.fn.expand("%:p:h")
  if dir == "" then
    dir = vim.fn.getcwd()
  end

  Snacks.picker.files({
    cwd = dir,
    title = "Files in: " .. vim.fn.fnamemodify(dir, ":~") .. " (Opt+N: create new)",
    win = {
      input = {
        keys = {
          ["<a-n>"] = { "create_new_file", mode = { "i", "n" } },
        },
      },
    },
    actions = {
      create_new_file = function(picker)
        picker:close()
        local input = vim.fn.input("Create new file: " .. dir .. "/")
        if input and input ~= "" then
          local full_path = dir .. "/" .. input
          local file_dir = vim.fn.fnamemodify(full_path, ":h")
          if vim.fn.isdirectory(file_dir) == 0 then
            vim.fn.mkdir(file_dir, "p")
          end
          vim.cmd("edit " .. vim.fn.fnameescape(full_path))
          vim.cmd("write")
        end
      end,
    },
  })
end, { desc = "Files in current dir (Opt+N: create new)" })

function M.setup_copilot_keymaps()
  return {
    { "<leader>ap", ":Copilot panel<CR>", desc = "Copilot panel" },
  }
end

return M
