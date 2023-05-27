local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nordtheme/vim",
        name = "nordtheme",
        lazy = false,
        config = function()
            vim.cmd("colorscheme nord")
        end,
        enabled = true,
    },
    {
        -- treesitter (add meaning to source files we edit, this allows better highlighting)
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            -- "JoosepAlviste/nvim-ts-context-commentstring",
            -- "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/playground",
        },
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "lua",
                    "rust",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "c",
                    "markdown",
                    "markdown_inline",
                },
                highlight = {
                    enable = true,
                    use_languagetree = true,
                },
                indent = { enable = true },
            })
        end,
        enabled = true,
    },
    {
        -- nvim-telescope (fuzzy search front end)
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("jlund/plugins/telescope")
        end,
        enabled = true,
    },
    {
        -- indent-blankline (add vertical lines to show indent matches easily)
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup()
        end,
        enabled = true,
    },
    {
        -- nvim-lspconfig (allow us to install and manage language servers with configs)
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "b0o/schemastore.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "jayp0521/mason-null-ls.nvim",
        },
        config = function()
            require("jlund/plugins/lspconfig")
        end,
        enabled = true,
    },
    {
        -- nvim-cmp (a completion engine frontend of neovim, works closely with LSPs)
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-nvim-lua",
        },
        config = function()
            require("jlund/plugins/cmp")
        end,
        enabled = true,
    },
})
