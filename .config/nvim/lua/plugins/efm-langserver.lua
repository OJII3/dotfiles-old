return {
	"mattn/efm-langserver",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "creativenull/efmls-configs-nvim" },
	},
	config = function()
		local nvim_lsp_efm = require("lspconfig").efm
		local languages = require("efmls-configs.defaults").languages()

		local stylua = require("efmls-configs.formatters.stylua")
		local clang_format = require("efmls-configs.formatters.clang_format")
		local clang_tidy = require("efmls-configs.linters.clang_tidy")
		local latexindent = require("efmls-configs.formatters.latexindent")
		local cmake_lint = require("efmls-configs.linters.cmake_lint")
		local shellcheck = require("efmls-configs.linters.shellcheck")
		local rustfmt = require("efmls-configs.formatters.rustfmt")
		local yamllint = require("efmls-configs.linters.yamllint")
		local cspell = require("efmls-configs.linters.cspell")
		local stylelint_formatter = require("efmls-configs.formatters.stylelint")
		-- TypeScript, JavaScript
		local eslint_linter = require("efmls-configs.linters.eslint_d")
		local eslint_formatter = require("efmls-configs.formatters.eslint_d")
		local prettier = require("efmls-configs.formatters.prettier_d")
		local biome = require("efmls-configs.formatters.biome")
		-- Python
		local black = require("efmls-configs.formatters.black")
		local isort = require("efmls-configs.formatters.isort")
		local autopep8 = require("efmls-configs.formatters.autopep8")
		local flake8 = require("efmls-configs.linters.flake8")
		local mypy = require("efmls-configs.linters.mypy")
		-- Haskell
		local formulu = require("efmls-configs.formatters.fourmolu")
		-- local typstfmt = require("efmls-configs.formatters.typstfmt")
		    -- local prettypst = require("efmls-configs.formatters.prettypst")
		local textlint = require("efmls-configs.linters.textlint")

		-- customized or manually installed linters/formatters
		-- local biome = {
		-- 	formatCommand = string.format("%s %s", "node_modules/.bin/biome", "check --apply --stdin-file-path '${INPUT}'"),
		-- 	formatStdin = true,
		-- 	roootMarkers = { "biome.json" },
		-- }
		local cmake_format = {
			formatCommand = "cmake-format ${--line-width:100} -",
			formatStdin = true,
			rootMarkers = { "CMakeLists.txt" },
		}
		local prettypst = {
			formatCommand = "prettypst --use-std-in --use-std-out",
			formatStdin = true,
		}
		-- local dotnet_format = {
		-- 	formatCommand = "dotnet format --include %s",
		-- 	formatStdin = true,
		-- 	rootMarkers = { ".editorconfig" },
		-- }

		nvim_lsp_efm.setup({
			init_options = {
				documentFormatting = true,
				codeAction = true,
			},
			filetypes = {
				"c",
				"cmake",
				"cpp",
				"cs",
				"css",
				"haskell",
				"javascript",
				"javascriptreact",
				"json",
				"latex",
				"lua",
				"markdown",
				"python",
				"rust",
				"sh",
				"typescript",
				"typescriptreact",
				"typst",
				"yaml",
			},
			settings = {
				rootMarkers = { ".git/" },
				languages = vim.tbl_extend("force", languages, {
					c = { clang_format, clang_tidy },
					cmake = { cmake_lint, cmake_format },
					cpp = { clang_format, clang_tidy },
					-- cs = { dotnet_format },
					css = { prettier, stylelint_formatter },
					haskell = { formulu },
					javascript = { eslint_linter, biome, prettier, eslint_formatter },
					javascriptreact = { eslint_linter, biome, prettier, eslint_formatter },
					json = { prettier },
					latex = { latexindent },
					lua = { stylua },
					markdown = { cspell, textlint },
					python = { black, isort, autopep8, flake8, mypy },
					rust = { rustfmt },
					sh = { shellcheck },
					typescript = { eslint_linter, prettier, eslint_formatter, biome },
					typescriptreact = { eslint_linter, prettier, eslint_formatter, biome },
					typst = { prettypst }, --, cspell, textlint },
					yaml = { yamllint },
				}),
			},
		})

		-- Format on save
		local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = lsp_fmt_group,
			callback = function(ev)
				local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })

				if vim.tbl_isempty(efm) then
					return
				end

				vim.lsp.buf.format({ name = "efm" })
			end,
		})
	end,
	event = "BufReadPre",
}
