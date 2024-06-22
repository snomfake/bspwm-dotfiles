return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local colors = {
      fg = "#FFFFFF",
      bg = "#181825",
      green = "#A6E3A1",
      red = "#F38BA8",
      yellow = "#FAB387",
      cyan = "#74C7EC",
      blue = "#179299",
      violet = "#cba6f7",
      orange = "#F9E2AF"
    }

    local function vi_mode()
      return "󰣇"
    end

    local function lsp_client()
      for _, client in ipairs(vim.lsp.get_active_clients()) do
        return client.name
      end
    end

    local function block()
      return "▊"
    end

    local lualine = require("lualine")
    lualine.setup({
      options = {
        theme = "catppuccin",
        section_separators = { right = "", left = "" }
      },
      sections = {
        lualine_a = {
          {
            block,
            color = { fg = colors.cyan, bg = colors.bg },
            padding = { left = 0, right = 1 }
          },
          {
            vi_mode,
            color = function()
              local mode_color = {
                n = colors.cyan,
                i = colors.green,
                v = colors.violet,
                [''] = colors.blue,
                V = colors.violet,
                c = colors.yellow,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.red,
                t = colors.red,
              }
              return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
            end,
            padding = { right = 1 }
          }
        },
        lualine_b = {
          {
            "branch",
            icon = "󰘬",
            color = { fg = colors.violet, bg = colors.bg }
          }
        },
        lualine_c = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { erros = " ", warn = " ", info = " " },
            diagnostics_color = {
              color_error = { fg = colors.red },
              color_warn = { fg = colors.yellow },
              color_info = { fg = colors.cyan }
            }
          }
        },
        lualine_x = {
          {
            lsp_client,
            icon = " ",
            color = { fg = colors.blue, bg = colors.bg, gui = "bold" },
            padding = { left = 0, right = 4 }
          }
        },
        lualine_y = {},
        lualine_z = {
          {
            "location",
            color = { fg = colors.green, bg = colors.bg, gui = "bold" },
          },
          {
            "fileformat",
            fmt = string.upper,
            icons_enabled = false,
            color = { fg = colors.green, bg = colors.bg, gui = "bold" },
          },
          {
            block,
            color = { fg = colors.cyan, bg = colors.bg },
            padding = { left = 1, right = 0 }
          }
        }
      }
    })
  end
}
