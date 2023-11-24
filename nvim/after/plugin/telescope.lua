require('telescope').setup({
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
    	fzf = {
      	fuzzy = true,                    -- false will only do exact matching
      	override_generic_sorter = true,  -- override the generic sorter
      	override_file_sorter = true,     -- override the file sorter
      	case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    	},
			file_browser = {
				hijack_netrw = true,
				hidden = true,
				depth = 3,
			}
  	}
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tt', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
