local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Barbar.nvim Keymap
-- Move to previous/next
map('n', '<C-n>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-i>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-n>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-i>', '<Cmd>BufferMoveNext<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<C-w>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

