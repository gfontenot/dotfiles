local template_utils = require('new-file-template.utils')
local utils = require('util')

-- Use a local copyright notice header if one is available
local copyright_notice =
  utils.load_file_with_fallback('~/.config/nvim/private/copyright/swift.txt', '')

local cursor = '|cursor|'

local function base_template(relative_path, filename)
  -- stylua: ignore
  return string.format([[
%s

%s]],
    copyright_notice,
    cursor
  )
end

local function test_template(relative_path, filename)
  local elems = template_utils.split(filename, '%.')
  local test_class = elems[1]
  -- stylua: ignore
  return string.format([[
%s

import XCTest

final class %s: XCTestCase {

    %s

}]],
    copyright_notice,
    test_class,
    cursor
  )
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    -- Unit Tests
    { pattern = '.*/UnitTests/.*', content = test_template },

    -- Base
    { pattern = '.*', content = base_template },
  }

  return template_utils.find_entry(template, opts)
end
