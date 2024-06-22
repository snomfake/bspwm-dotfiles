return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",
    "windwp/nvim-autopairs"
  },
  config = function()
    -- cmp
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function() end
      },
      mapping = {
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<cr>"] = cmp.mapping.confirm()
      },
      sources = {
        { name = "nvim_lsp" }
      },
      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 50
        })
      }
    })
    -- autopairs
    require("nvim-autopairs").setup({})
  end
}
