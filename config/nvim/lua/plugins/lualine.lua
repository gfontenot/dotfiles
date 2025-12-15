return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-mini/mini.nvim',
    'webhooked/kanso.nvim',
  },
  config = function()
    -- Modified from the evil_lualine example code
    -- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
    local custom_icons = require('config.icons')
    local lualine = require('lualine')
    local colors = require('kanso.colors').setup({ theme = 'mist' })
    local theme = colors.theme
    local palette = colors.palette

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = theme.ui.fg, bg = theme.ui.bg } },
          inactive = { c = { fg = theme.ui.fg, bg = theme.ui.bg } },
        },
        globalstatus = true,
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      function()
        return custom_icons.left_spacer
      end,
      color = { fg = palette.green }, -- Sets highlighting of component
      padding = { left = 0, right = 1 }, -- We don't need space before this
    })

    ins_left({
      -- mode component
      function()
        return custom_icons.status.main
      end,
      color = function()
        -- auto change color according to neovims mode
        local mode_groups = {
          [palette.green] = { 'n', 'no', 'cv', 'ce', '!', 't' },
          [palette.aqua] = { 'i' },
          [palette.pink] = { 'v', 'V', 'c' },
          [palette.orange] = { 's', 'S', 'ic', 'R', 'Rv', 'r', 'rm', 'r?' },
        }

        local current_mode = vim.fn.mode()
        for color, modes in pairs(mode_groups) do
          for _, mode in ipairs(modes) do
            if mode == current_mode then
              return { fg = color }
            end
          end
        end

        return { fg = palette.green } -- fallback
      end,
      padding = { right = 1 },
    })

    ins_right({
      function()
        local status = require('sidekick.status').cli()
        return custom_icons.status.sidekick .. ' ' .. (#status > 1 and #status or '')
      end,
      cond = function()
        return #require('sidekick.status').cli() > 0
      end,
      color = function()
        return 'Special'
      end,
    })

    ins_right({
      'branch',
    })

    ins_right({
      'diagnostics',
      sources = { 'nvim_workspace_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = {
        error = custom_icons.diagnostics_spaced.error,
        warn = custom_icons.diagnostics_spaced.warn,
      },
      colored = true,
      update_in_insert = false,
      always_visible = false,
    })

    ins_right({
      function()
        return custom_icons.right_spacer
      end,
      color = { fg = palette.green },
      padding = { left = 1 },
    })

    lualine.setup(config)
  end,
}
