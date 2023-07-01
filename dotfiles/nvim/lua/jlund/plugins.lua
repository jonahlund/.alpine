-- An array to hold the various plugins and their configurations.
local plugins = {
	-- plenary.nvim: A library of utility functions for Neovim plugins.
	"nvim-lua/plenary.nvim",

	-- nord: A color scheme based on the Nord theme.
	{
		"nordtheme/vim",
		name = "nord",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd [[colorscheme nord]]
		end,
	},

	-- nvim-lspconfig: Configuration utilities for the Neovim's built-in LSP client.
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim", -- provides a way to use Neovim as a language server
				config = function()
					require "jlund.config.null-ls"
				end,
			},
			"jayp0521/mason-null-ls.nvim",
		},
		config = function(_, opts)
			require "jlund.config.lspconfig"
		end,
	},

	-- nvim-treesitter: Provides syntax highlighting and other features based on Tree-sitter parsers.
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require "jlund.config.treesitter"
		end,
	},

	-- mason.nvim: A package manager for Neovim.
	{
		"williamboman/mason.nvim",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonInstallAll",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
		},
		opts = function()
			return require "jlund.config.mason"
		end,
		config = function(_, opts)
			require("mason").setup(opts)

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd(
					"MasonInstall " .. table.concat(opts.ensure_installed, " ")
				)
			end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	-- trouble.nvim: A pretty list for diagnostics and references.
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- dependency for web devicons
	},

	-- mason-lspconfig.nvim: Adds LSP support to mason.nvim.
	{ "williamboman/mason-lspconfig.nvim" },

	-- telescope.nvim: A highly customizable fuzzy finder for Neovim.
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
	},

	-- indent-blankline.nvim: Adds vertical lines to indicate indentation levels.
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup()
		end,
		enabled = true,
	},

	-- nvim-cmp: Autocomplete plugin.
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip", -- snippet support for nvim-cmp
				dependencies = "rafamadriz/friendly-snippets", -- snippets collections
				opts = {
					history = true,
					updateevents = "TextChanged,TextChangedI",
				},
				config = function(_, opts)
					require("jlund.config.luasnip").luasnip(opts)
				end,
			},
			{
				"windwp/nvim-autopairs", -- autopairing for brackets, parentheses, etc.
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs =
						require "nvim-autopairs.completion.cmp"
					require("cmp").event:on(
						"confirm_done",
						cmp_autopairs.on_confirm_done()
					)
				end,
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		opts = function()
			return require "jlund.config.cmp"
		end,
	},
}

-- Setup lazy loading for the plugins
require("lazy").setup(plugins)
