local M = {}

M.treesitter = {
	ensure_installed = {
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"markdown",
		"markdown_inline",
		"rust",
	},
	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",

		-- rust
		"rust-analyzer",
		"rustfmt",
	},
}

M.telescope = {
	plugin = true,

	i = {
		--... your other mappings

		["<C-j>"] = {
			function()
				require("telescope.actions").move_selection_next()
			end,
			"Move down",
		},

		["<C-k>"] = {
			function()
				require("telescope.actions").move_selection_previous()
			end,
			"Move up",
		},
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
		ignore = false,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},

	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
}

return M
