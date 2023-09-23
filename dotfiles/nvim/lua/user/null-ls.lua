local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
		},
	},
}

function M.config()
	local null_ls = require "null-ls"
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
	local formatting = null_ls.builtins.formatting
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	-- https://github.com/prettier-solidity/prettier-plugin-solidity
	null_ls.setup {
		debug = false,
		on_attach = function(client, bufnr)
			if client.supports_method "textDocument/formatting" then
				vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
						vim.lsp.buf.format { async = false }
					end,
				})
			end
		end,
		sources = {
			formatting.prettier.with {
				extra_filetypes = { "toml" },
				extra_args = {
					"--no-semi",
					"--single-quote",
					"--jsx-single-quote",
				},
			},
			formatting.stylua,
			formatting.rustfmt,
		},
	}
end

return M
