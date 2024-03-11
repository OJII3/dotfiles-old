return {
	"rbong/vim-flog",
	lazy = true,
	cmd = { "Flog", "Flogsplit", "Floggit" },
	dependencies = {
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	keys = {
		{ "<Leader>fl", "<cmd>Flog -raw-args=--branches<CR>", { noremap = true, silent = true } },
	},
}
