local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	-- Lua
	b.formatting.stylua,

	-- rust
	b.formatting.rustfmt,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
	debug = true,
	sources = sources,
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method "textDocument/formatting" then
			vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format { async = false }
				end,
			})
		end
	end,
}
