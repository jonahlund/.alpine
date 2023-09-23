local M = {
	"nvim-telescope/telescope.nvim",
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{
			"ahmedkhalf/project.nvim",
		},
	},
}

local actions = require "telescope.actions"

M.opts = {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		file_ignore_patterns = {
			".git/",
			"node_modules",
			"target",
			"Cargo.lock",
			".yarn",
		},
		mappings = {
			i = {
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-l>"] = actions.select_default,
			},
		},
	},
}

return M
