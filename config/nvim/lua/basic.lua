-- options
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 3
vim.opt.swapfile = false

-- mappings
vim.keymap.set("n", "db", "vb\"_d")
vim.keymap.set("n", "<c-a>", "ggVG")
vim.keymap.set("n", "<esc>", ":nohl<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<c-w>", ":bw<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<tab>", ":bnext<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<c-h>", "<c-w>W")
vim.keymap.set("n", "<c-l>", "<c-w>w")

vim.keymap.set("n", "<c-p>", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<a-1>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true
        }
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "󰉋 Explorer"
            }
          }
        }
      })
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("nvim-tree").setup({})
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { ".git/" }
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
            layout_config = {
              height = 15
            }
          }
        }
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        scope = {
          enabled = false,
          show_start = false,
          show_end = false
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim"
    },
    config = function()
      require("lspconfig")['gopls'].setup({
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        cmd = { "gopls", "serve" }
      })

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
    end
  }
})

-- formatting
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- highlight on yank
vim.cmd [[augroup highlight_yank]]
vim.cmd [[autocmd!]]
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank({ higroup="IncSearch", timeout=250 })]]
vim.cmd [[augroup END]]
