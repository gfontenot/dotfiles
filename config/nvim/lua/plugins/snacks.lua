return {
  'folke/snacks.nvim',
  dependencies = {
    'folke/which-key.nvim',
  },
  priority = 1000,
  lazy = false,
  config = function()
    local Snacks = require('snacks')
    Snacks.setup({
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          {
            icon = ' ',
            title = 'Recent Files',
            section = 'recent_files',
            cwd = true,
            indent = 2,
            padding = 1,
          },
          { section = 'startup' },
        },
      },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = {
        enabled = true,
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ['Y'] = { 'copy_path_to_clipboard', mode = { 'n', 'x' } },
                },
              },
            },
            actions = {
              copy_path_to_clipboard = function(picker)
                local files = {} ---@type string[]
                if vim.fn.mode():find('^[vV]') then
                  picker.list:select()
                end
                for _, item in ipairs(picker:selected({ fallback = true })) do
                  table.insert(files, Snacks.picker.util.path(item))
                end
                picker.list:set_selected() -- clear selection
                local value = table.concat(files, '\n')
                vim.fn.setreg('+', value, 'l') -- <- this changed
                Snacks.notify.info('Yanked ' .. #files .. ' files')
              end,
            },
          },
        },
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    })

    local wk = require('which-key')

    wk.add({})

    -- Picker
    wk.add({
      {
        '<C-p>',
        function()
          Snacks.picker.files({ hidden = true })
        end,
        desc = 'Open file [P]icker',
      },
      {
        '<Leader>pb',
        function()
          Snacks.picker.buffers()
        end,
        desc = '[P]ick open [B]uffer',
      },
      {
        '<Leader>pg',
        function()
          Snacks.picker.git_status()
        end,
        desc = '[P]ick from [G]it status',
      },
      {
        '<Leader>ps',
        function()
          Snacks.picker.grep()
        end,
        desc = '[P]ick from live [S]earch',
      },
      {
        '<C-k>',
        function()
          Snacks.picker.grep_word()
        end,
        desc = 'Search for the word under the cursor',
      },
      {
        '<C-e>',
        function()
          Snacks.explorer()
        end,
        desc = 'Open file [E]xplorer',
      },
      {
        '<Leader>pp',
        function()
          Snacks.picker()
        end,
        desc = '[P]ick from available [P]ickers',
      },
    })

    -- Terminal
    wk.add({
      {
        '<C-/>',
        mode = { 'n', 't' },
        function()
          Snacks.terminal()
        end,
        desc = 'Toggle floating terminal',
      },
    })

    -- Git
    wk.add({
      {
        '<Leader>gg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Launch lazygit',
      },
      {
        '<Leader>gb',
        mode = { 'n', 'v' },
        function()
          Snacks.gitbrowse()
        end,
        desc = '[G]it [B]rowse',
      },
    })
  end,
}
