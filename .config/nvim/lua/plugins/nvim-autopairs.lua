return {
	"windwp/nvim-autopairs",
	init = function()
		local autopairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		autopairs.add_rule(Rule("$$", "$$", "tex"))
		autopairs.add_rule(Rule("$", "$", "typst"))
	end,
	opts = {
		map_c_w = true,
		map_c_h = true,
		check_ts = true,
		enable_check_bracket_line = true,
	},
	event = "InsertEnter",
}
