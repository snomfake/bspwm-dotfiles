return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local ts = require("nvim-treesitter.configs")
    ts.setup({
      ensure_installed = { "lua", "python", "html" },
      sync_install = true,
      highlight = { enable = true }
    })
  end
}
