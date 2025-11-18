-- Helper function to extract base filename by removing test/mock prefixes and suffixes
local function get_base_filename()
  local filename = vim.fn.expand('%:t:r')

  -- Strip Swift/ObjC extension suffixes: Foo+Bar -> Foo
  filename = filename:gsub('%+.*$', '')

  -- Strip suffixes (with optional delimiter): Tests, Test, Spec
  -- Pattern matches: Tests, tests, TESTS, _tests, -test, etc.
  filename = filename:gsub('[_-]?[Tt][Ee][Ss][Tt][Ss]?$', '') -- _tests
  filename = filename:gsub('[_-]?[Ss][Pp][Ee][Cc]$', '') -- _spec

  -- Strip prefixes (with optional delimiter): Fake, Mock, Stub, Real
  -- Pattern matches: Fake, fake, FAKE, fake_, mock-, etc.
  filename = filename:gsub('^[Ff][Aa][Kk][Ee][_-]?', '') -- Fake_
  filename = filename:gsub('^[Rr][Ee][Aa][Ll][_-]?', '') -- Real_
  filename = filename:gsub('^[Mm][Oo][Cc][Kk][_-]?', '') -- Mock_
  filename = filename:gsub('^[Ss][Tt][Uu][Bb][_-]?', '') -- Stub_

  return filename
end

local function configure_keymaps(Snacks)
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
      '<Leader>pr',
      function()
        local current_file = vim.fn.expand('%:p')
        local base_name = get_base_filename()
        local cwd = vim.fn.getcwd()

        -- Use fd to find files matching the base name (case-insensitive)
        local cmd = string.format('fd --type f --hidden --color never -i "%s" "%s"', base_name, cwd)
        local files = vim.fn.systemlist(cmd)

        -- Convert to items and filter out current file
        local items = {}
        for _, file in ipairs(files) do
          local abs_path = vim.fn.fnamemodify(file, ':p')
          if abs_path ~= current_file then
            table.insert(items, {
              text = file,
              file = abs_path,
            })
          end
        end

        Snacks.picker.pick({
          title = 'Related',
          items = items,
          auto_confirm = true,
        })
      end,
      desc = '[P]ick from [R]elated files',
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
end

-- Config for the dashboard
local function dashboard(Snacks)
  return {
    enabled = true,
    preset = {
      keys = {
        {
          icon = ' ',
          key = 'f',
          desc = 'Find File',
          action = ":lua Snacks.dashboard.pick('files')",
        },
        {
          icon = ' ',
          key = 's',
          desc = 'Find Text',
          action = ":lua Snacks.dashboard.pick('live_grep')",
        },
        {
          icon = ' ',
          key = 'r',
          desc = 'Recent Files',
          action = ":lua Snacks.dashboard.pick('oldfiles')",
        },
        {
          icon = ' ',
          key = 'S',
          desc = 'Restore Session',
          section = 'session',
        },
        {
          icon = '󰒲 ',
          key = 'L',
          desc = 'Lazy',
          action = ':Lazy',
          enabled = package.loaded.lazy ~= nil,
        },
        { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
      },
    },
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
  }
end

-- Config for the picker
local function picker(snacks)
  return {
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
            vim.fn.setreg('+', value, 'l')
            Snacks.notify.info('Yanked ' .. #files .. ' files')
          end,
        },
      },
    },
  }
end

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
      dashboard = dashboard(Snacks),
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = picker(Snacks),
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    })
    configure_keymaps(Snacks)
  end,
}
