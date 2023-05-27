local autocmd = vim.api.nvim_create_autocmd

autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
	callback = function()
		vim.t.bufs = vim.tbl_filter(function(bufnr)
			return vim.api.nvim_buf_get_option(bufnr, "modified")
		end, vim.t.bufs)
	end,
})

local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 50
