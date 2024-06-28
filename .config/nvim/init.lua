--[[

Kickstart.nvim is a template for your own configuration.
  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/

  And then you can explore or search through `:help lua-guide`


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ
--]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
	-- NOTE: First, some plugins that don't require any configuration

	-- Git related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	-- Detect tabstop and shiftwidth automatically
	-- 'tpope/vim-sleuth',

	-- Underline matches to the word under the cursor
	'itchyny/vim-cursorword',

	-- Move windows around
	'sindrets/winshift.nvim',

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},

	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	},

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim',          opts = {} },

	'sainnhe/edge',
	'Th3Whit3Wolf/one-nvim',

	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require 'nvim-treesitter.configs'.setup {
				highlight = {
					enable = true,
				}
			}
		end,
	},




	{
		-- Set lualine as statusline
		'nvim-lualine/lualine.nvim',
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = 'onedark',
				component_separators = '|',
				section_separators = '',
			},
		},
	},

	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim',         opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},

	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},

	'MunifTanjim/nui.nvim',
	-- 'rmagatti/auto-spession',

	{
		"gennaro-tedesco/nvim-possession",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		config = true,
		init = function()
			local possession = require("nvim-possession")
			vim.keymap.set("n", "<leader>sl", function()
				possession.list()
			end)
			vim.keymap.set("n", "<leader>sn", function()
				possession.new()
			end)
			vim.keymap.set("n", "<leader>su", function()
				possession.update()
			end)
			vim.keymap.set("n", "<leader>sd", function()
				possession.delete()
			end)
		end,
		autosave = {
			current = true,   -- or fun(name): boolean
			tmp = true,       -- or fun(): boolean
			tmp_name = 'tmp', -- or fun(): string
			on_load = true,
			on_quit = true,
		},
	},

	'kchmck/vim-coffee-script',

	-- require("gennaro-tedesco/nvim-possession").setup({
	-- 	autoload = true -- default false
	-- })

	-- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
	--       These are some example plugins that I've included in the kickstart repository.
	--       Uncomment any of the lines below to enable them.
	-- require 'kickstart.plugins.autoformat',
	-- require 'kickstart.plugins.debug',

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
	--    up-to-date with whatever is in the kickstart repo.
	--    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--
	--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
	-- { import = 'custom.plugins' },

	'nvim-tree/nvim-web-devicons',

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		-- dependencies = {
		--   "nvim-tree/nvim-web-devicons",
		-- },
		config = function()
			require("nvim-tree").setup {}
		end,
	},

	'dcampos/nvim-snippy',
	'honza/vim-snippets',

	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
	},


	{ 'project0n/github-nvim-theme' },
	{
		'projekt0n/github-nvim-theme',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('github-theme').setup({
			})
			vim.cmd('colorscheme github_dark')
		end,
	},

	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,

		config = function(_, opts)
			require('catppuccin').setup(opts)
			-- vim.cmd.colorscheme 'catppuccin'
		end,
	}

}, {})

require('snippy').setup({
	mappings = {
		is = {
			['<Tab>'] = 'expand_or_advance',
			['<S-Tab>'] = 'previous',
		},
		nx = {
			['<leader>x'] = 'cut_text',
		},
	},
})

-- jr
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<C-W>m', ':WinShift<CR>')


-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
	["<C-Down>"] = require('telescope.actions').cycle_history_next,
	["<C-Up>"] = require('telescope.actions').cycle_history_prev,
      },
    },
  },
  pickers = {
    buffers = {
      -- https://github.com/nvim-telescope/telescope.nvim/issues/179
      sort_lastused = true
    },
    colorscheme = {
      enable_preview = true
    }
  }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>im', require('telescope.builtin').man_pages, { desc = 'Info: manpages' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Git files' })
vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = 'Git branches' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Git files' })
vim.keymap.set('n', '<leader>gh', require('telescope.builtin').git_stash, { desc = 'Git stash' })
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'Git status' })

vim.keymap.set('n', '<leader>ld', require('telescope.builtin').lsp_definitions, { desc = 'LSP definitions' })
vim.keymap.set('n', '<leader>lr', require('telescope.builtin').lsp_references, { desc = 'LSP references' })
vim.keymap.set('n', '<leader>li', require('telescope.builtin').lsp_incoming_calls, { desc = 'LSP references' })
vim.keymap.set('n', '<leader>ls', require('telescope.builtin').lsp_document_symbols, { desc = 'LSP symbols - document' })
vim.keymap.set('n', '<leader>lw', require('telescope.builtin').lsp_workspace_symbols, { desc = 'LSP symbols - workspace' })

vim.keymap.set('n', '<leader>sa', require('telescope.builtin').tags, { desc = 'Search tags' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').builtin, { desc = 'Search builtins' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[S]earch current [C]urrent_buffer_fuzzy_find' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search grep' })
vim.keymap.set('n', '<leader>si', require('telescope.builtin').registers, { desc = 'Search registers' })
vim.keymap.set('n', '<leader>sm', require('telescope.builtin').marks, { desc = 'Search marks' })
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').planets, { desc = 'Search planets' })
vim.keymap.set('n', '<leader>sq', require('telescope.builtin').quickfix, { desc = 'Search quickfix' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Search resume' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').treesitter, { desc = 'Search treesitter symbols' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current word' })

vim.keymap.set('n', '<leader>co', require('telescope.builtin').commands, { desc = 'Vim: commands' })
vim.keymap.set('n', '<leader>vh', require('telescope.builtin').help_tags, { desc = 'Vim: help' })
vim.keymap.set('n', '<leader>vc', require('telescope.builtin').colorscheme, { desc = 'Vim: colorschemes' })
vim.keymap.set('n', '<leader>vk', require('telescope.builtin').keymaps, { desc = 'Vim: keymaps' })
vim.keymap.set('n', '<leader>vp', require('telescope.builtin').pickers, { desc = 'Vim: pickers' })
vim.keymap.set('n', '<leader>vv', require('telescope.builtin').vim_options, { desc = 'Vim: vim options' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'dockerfile', 'lua', 'perl', 'python', 'ruby', 'tsx', 'typescript', 'terraform', 'vimdoc',
  'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = true,
  sync_install = false,
  ignore_install = {},


  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
	-- You can use the capture groups defined in textobjects.scm
	['aa'] = '@parameter.outer',
	['ia'] = '@parameter.inner',
	['af'] = '@function.outer',
	['if'] = '@function.inner',
	['ac'] = '@class.outer',
	['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
	[']m'] = '@function.outer',
	[']]'] = '@class.outer',
      },
      goto_next_end = {
	[']M'] = '@function.outer',
	[']['] = '@class.outer',
      },
      goto_previous_start = {
	['[m'] = '@function.outer',
	['[['] = '@class.outer',
      },
      goto_previous_end = {
	['[M'] = '@function.outer',
	['[]'] = '@class.outer',
      },
    },
  },
}

vim.treesitter.language.register('javascript', '.coffee')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end

local servers = {

        lua_ls = {
                Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                        diagnostics = { disable = { 'missing-fields' } },
                },
        },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		}
	end,
}

local nvim_lsp = require('lspconfig')
nvim_lsp.solargraph.setup {
	settings = {
		autoformat = true,
		completion = true,
		diagnostic = true,
		folding = true,
		references = true,
		rename = true,
		symbols = true
	}
}


-- From https://github.com/neovim/nvim-lspconfig
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})



vim.keymap.set('n', ';', ':')
-- vim.keymap.set('n', '<leader>t', 'NERDTree')
vim.g.tags = './tags'
vim.keymap.set('n', '<leader>a', ':w<cr>')
vim.keymap.set('n', '<c-l>', '<c-w>l')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-j>', '<c-w>j')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- Autoremove trailing spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  command = "setlocal tabstop=4 shiftwidth=4 expandtab",
})



-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set the number of spaces for each tab (e.g., 4 spaces)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2


-- vim.o.background = 'light'
-- vim.cmd [[colorscheme one-nvim]]

vim.wo.number = false

vim.o.background = 'light'
-- vim.cmd [[colorscheme adwaita]]
--
-- vim.cmd [[colorscheme catppuccin]]
-- vim.cmd [[colorscheme slate]]

-- vim.cmd [[colorscheme github_light]]
-- vim.cmd [[colorscheme github_dark]]
--require "/home/jeff/.config/nvim/themetype"
require "colors"
