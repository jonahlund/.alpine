---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		["<C-c>"] = "",
    ["Q"] = "",
	},
}

M.general = {
  v = {
    ["J"] = {":m '>+1<CR>gv=gv"},
    ["K"] = {":m '<-2<CR>gv=gv"},
  },
  n = {
    ["<C-c>"] = {"<Esc>"},
    ["<C-d>"] = {"<C-d>zz"},
    ["<C-u>"] = {"<C-u>zz"},
    ["<leader>x"] = {"<cmd>!chmod +x %<CR>"}
  },
	i = {
    ["<C-c>"] = {"<Esc>"},
  },
}

-- more keybinds!

return M
