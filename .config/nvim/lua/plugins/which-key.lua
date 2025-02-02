return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")

		wk.setup({
			triggers_blacklist = {
				i = { "j", "k", "<Shift-,>" },
				v = { "j", "k" },
			},
		})

		wk.register({
			["<C-l>"] = "Whole lines",
			["<C-n>"] = "keywords in the current file",
			["<C-k>"] = "keywords in dictionary",
			["<C-t>"] = "keywords in thesaurus",
			["<C-i>"] = "keywords in the current and included files",
			["<C-]>"] = "tags",
			["<C-f>"] = "file names",
			["<C-d>"] = "definitions or macros",
			["<C-v>"] = "Vim command-line",
			["<C-u>"] = "User defined completion",
			["<C-o>"] = "omni completion",
			["<C-s>"] = "Spelling suggestions",
			["<C-z>"] = "stop completion",
		}, {
			mode = "i",
			prefix = "<C-x>",
		})

		wk.register({}, {
			mode = "i",
			prefix = "<Shift-,>",
		})
	end,
  event = "BufWinEnter",
}
