local template_utils = require('new-file-template.utils')
local utils = require('util')

-- Use a local copyright notice header if one is available
local copyright_notice =
  utils.load_file_with_fallback('~/.config/nvim/private/copyright/swift.txt', '')

local function base_template(relative_path, filename)
  return copyright_notice .. '\n\n|cursor|'
end

local function test_template(relative_path, filename)
  local elems = template_utils.split(filename, '.')
  local test_class = elems[1]
  return copyright_notice
    .. [[

import XCTest

final class ]]
    .. test_class
    .. [[: XCTestCase {
    |cursor|
}]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = '.*', content = base_template },
    { pattern = '.*/UnitTests/.*', content = test_template },
  }

  return template_utils.find_entry(template, opts)
end
