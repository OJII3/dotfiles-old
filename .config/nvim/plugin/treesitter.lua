local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"css",
		"diff",
		"dockerfile",
		"git_config",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"graphql",
		"html",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"latex",
		"lua",
		"markdown",
		"markdown",
		"markdown_inline",
		"python",
		"regex",
		"rust",
		"toml",
		"tsx",
		"typescript",
		"typst",
		"vimdoc",
		"xml",
		"yaml",
	},
	highlight = {
		enable = true,
		disable = { "latex" },
		additional_vim_regex_highlighting = { "letex", "markdown" },
	},
	indent = {
		enable = true,
	},
	tree_docs = {
		enable = true,
	},
	autotag = {
		enable = true,
		enable_close_on_slash = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
	},
})

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- -- -@diagnostic disable-next-line: inject-field
-- parser_config.typst = {
-- 	install_info = {
-- 		url = "https://github.com/SeniorMars/tree-sitter-typst.git", -- local path or git repo
-- 		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
-- 		-- optional entries:
-- 		branch = "main", -- default branch in case of git repo if different from master
-- 		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
-- 		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
-- 	},
-- 	filetype = "typst", -- if filetype does not match the parser name
-- }
