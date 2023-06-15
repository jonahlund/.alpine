local plugins = {
	"nvim-lua/plenary.nvim",
	{
		"nordtheme/vim",
		name = "nord",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd [[colorscheme nord]]
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require "jlund.config.null-ls"
				end,
			},
		},
		config = function(_, opts)
			require "jlund.config.lspconfig"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
	},
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
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
	},

	{
		-- indent-blankline (add vertical lines to show indent matches easily)
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup()
		end,
		enabled = true,
	},

	-- load luasnips + cmp related in insert mode only
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = {
					history = true,
					updateevents = "TextChanged,TextChangedI",
				},
				config = function(_, opts)
					require("jlund.config.luasnip").luasnip(opts)
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
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

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require "jlund.config.cmp"
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
}

require("lazy").setup(plugins)
