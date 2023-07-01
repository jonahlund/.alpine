vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- text manipulation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<Esc>", "<Esc><cmd>noh<CR>")

-- esc
vim.keymap.set("n", "<C-c>", "<Esc><cmd>noh<CR>")
vim.keymap.set("i", "<C-c>", "<Esc>")

-- nop
vim.keymap.set("n", "Q", "<nop>")

-- formatting
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
vim.keymap.set(
	"n",
	"<leader>fa",
	"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>"
)
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>")
vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>")
vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
vim.keymap.set(
	"n",
	"<leader>fz",
	"<cmd> Telescope current_buffer_fuzzy_find <CR>"
)

-- problem navigating
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- make current buffer executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- debugging
vim.api.nvim_set_keymap(
	"n",
	"<F5>",
	"<cmd>lua require'dap'.continue()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<F10>",
	"<cmd>lua require'dap'.step_over()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<F11>",
	"<cmd>lua require'dap'.step_into()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<F12>",
	"<cmd>lua require'dap'.toggle_breakpoint()<CR>",
	{ noremap = true }
)
