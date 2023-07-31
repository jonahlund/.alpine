require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<C-l>"] = require("telescope.actions").select_default,
			},
		},
	},
}
