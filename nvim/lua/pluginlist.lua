return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end
	-- },
	{
		'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
	{
		"nyoom-engineering/oxocarbon.nvim",
		priority = 1000,
		config = function ()
			vim.opt.background = "dark"
			vim.cmd("colorscheme oxocarbon")
		end
	},
	{
		"typicode/bg.nvim",
		lazy = false
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require('lualine').setup({
				icons_enabled = true,
				theme = 'gruvbox',
			})
		end,
	},
	"williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	'folke/neodev.nvim', -- new
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-nvim-lsp',
    },
  },
	{
		'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		'm4xshen/autoclose.nvim',
		config = function()
			require("autoclose").setup()
		end,
	},
	{
		'barrett-ruth/live-server.nvim',
		build = 'pnpm -g add live-server',
		config = function()
			require('live-server').setup()
		end,
	},
	{
		'xiyaowong/transparent.nvim',
		config = function()
			require("transparent").setup({ -- Optional, you don't have to run setup.
				groups = { -- table: default groups
    			'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    			'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
					'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
					'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
					'EndOfBuffer',
				},
				extra_groups = {}, -- table: additional groups that should be cleared
				exclude_groups = {}, -- table: groups you don't want to clear
			})
			require('transparent').clear_prefix('lualine')
		end,
	},
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end,
	},
	{
		'andweeb/presence.nvim',
		config = function()
			require('presence').setup({
				auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
				main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
				client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
				log_level           = 'error',                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number  = false,                      -- Displays the current line number instead of the current project
				blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				show_time           = true,                       -- Show the timer

				-- Rich Presence text options
				editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end,
	}
}
