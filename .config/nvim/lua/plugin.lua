-- auto bootstrap lazy.nvim ======================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nivm ==========================================================

-- vim.g.mapleader = ' ' -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	{ import = "plugins" },
	{ "folke/which-key.nvim" },
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		event = "VeryLazy",
		lazy = true,
	},
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.*",
	},
	{ "nvim-lualine/lualine.nvim" },
	-- colorscheme ----------------
	{ "folke/tokyonight.nvim", lazy = true },
	{ "ayu-theme/ayu-vim", lazy = true },
	{ "cocopon/iceberg.vim", lazy = true },
	------------------------------
	-- { "neoclide/coc.nvim",        branch = "release" },
	-- {
	--   'nmac427/guess-indent.nvim',
	--   config = function() require('guess-indent').setup {} end,
	-- },
	-- builtin lsp
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/neodev.nvim",
				config = function()
					require("neodev").setup({})
				end,
				ft = { "lua" },
			},
			{ "folke/neoconf.nvim" },
			{
				"williamboman/mason-lspconfig.nvim",
				cmd = { "LspInstall", "LspUninstall" },
			},
			{ "lvimuser/lsp-inlayhints.nvim" },
		},
	},
	-- {
	-- 	"glepnir/lspsaga.nvim",
	-- 	branch = "main",
	-- },
	-- cmp
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		{ "hrsh7th/cmp-nvim-lsp" },
	-- 		{ "hrsh7th/cmp-vsnip" },
	-- 		{ "hrsh7th/cmp-buffer" },
	-- 		{ "hrsh7th/cmp-path" },
	-- 		{ "hrsh7th/cmp-cmdline" },
	-- 		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	-- 		{ "onsails/lspkind-nvim" },
	-- 	},
	-- },
	{ "creativenull/efmls-configs-nvim", dependencies = {
		{ "neovim/nvim-lspconfig" },
	} },
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "make install_jsregexp",
	},
	{
		"windwp/nvim-autopairs",
		init = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		init = function()
			require("nvim-surround").setup()
		end,
	},
	-- { "lewis6991/gitsigns.nvim", lazy = true },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, event = "VeryLazy", lazy = true },
	{ "windwp/nvim-ts-autotag" },
	{ "ggandor/lightspeed.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	{
		"nvim-treesitter/nvim-tree-docs",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{ "github/Copilot.vim" },
	{ "vim-denops/denops.vim" },
	{ "vim-skk/skkeleton", dependencies = { "vim-denops/denops.vim" } },
	{
		"lambdalisue/kensaku-search.vim",
		dependencies = {
			{ "vim-denops/denops.vim" },
			{ "lambdalisue/kensaku.vim" },
		},
	},
	-- { "ryicoh/deepl.vim", },
	-- { 'haya14busa/vim-edgemotion' },
	{ "tpope/vim-commentary" },
	{ "johngrib/vim-game-code-break" },
	-- { "romgrk/barbar.nvim" },
	{ "akinsho/toggleterm.nvim", config = true },
	{ "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"kaarmu/typst.vim",
		lazy = true,
		ft = { "typst" },
	},
	{ "monaqa/dial.nvim" },
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui" },
		lazy = true,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
		lazy = true,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		lazy = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
	},
	{
		"glacambre/firenvim",
		lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn["firenvim#install"](0)
		end,
	},
})
