local hop = require('hop')
local directions = require('hop.hint').HintDirection
--[[ vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true}) ]]

vim.keymap.set('', 's',':HopWord<CR>', {noremap=true})

vim.keymap.set('', 'S',':HopPattern<CR>', {noremap=true})

