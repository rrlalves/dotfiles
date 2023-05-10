require("telescope").setup {
  extensions = {
    file_browser = {
      -- theme = "fzy_native",
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
      grouped = true,
      hidden = true,
    },
  },
  pickers = {
      find_files = {
          hidden = true,
      },
  },
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

-- vim.api.nvim_set_keymap(
--   "n",
--   "<space>fb",
--   ":Telescope file_browser<cr>",
--   { noremap = true }
-- )

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
  { noremap = true }
)
