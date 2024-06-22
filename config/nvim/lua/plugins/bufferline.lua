return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        hover = {
          enabled = true
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "󰉋 Explorer"
          }
        }
      }
    })
  end
}
