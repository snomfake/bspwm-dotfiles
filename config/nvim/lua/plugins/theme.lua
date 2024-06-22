return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    local color = require("catppuccin")
    color.setup({
      flavour = "mocha",
      no_italic = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true
      }
    })
    vim.cmd.colorscheme("catppuccin")
  end
}
