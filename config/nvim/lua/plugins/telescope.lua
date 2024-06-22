return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { ".git/", "env/", "__pycache__" }
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
          layout_config = { height = 15 }
        }
      }
    })
  end
}
