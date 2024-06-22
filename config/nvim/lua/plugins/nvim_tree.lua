return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nt = require("nvim-tree")
    nt.setup({
      renderer = {
        root_folder_label = false
      }
    })
  end
}
