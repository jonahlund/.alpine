require "jlund.mappings"
require "jlund.set"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	require("jlund.core.bootstrap").lazy(lazypath)

	-- install plugins
	require "jlund.plugins"

	require("jlund.core.bootstrap").mason()
end

vim.opt.rtp:prepend(lazypath)

require "jlund.plugins"
