return {
	"vim-skk/skkeleton",
	dependencies = { "vim-denops/denops.vim" },
	config = function() end,
	keys = {
		{ "<C-j>", "<Plug>(skkeleton-enable)", mode = "i" },
		{ "<C-l>", "<Plug>(skkeleton-disable)", mode = "i" },
	},
	-- event = "InsertEnter",
	lazy = false,
}
