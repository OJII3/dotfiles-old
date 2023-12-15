local nvim_lsp = require("lspconfig").efm
local languages = require("efmls-configs.defaults").languages()

local eslint_linter = require("efmls-configs.linters.eslint")
local eslint_formatter = require("efmls-configs.formatters.eslint")
local prettier = require("efmls-configs.formatters.prettier")
local biome = require("efmls-configs.formatters.biome")
local stylelint_linter = require("efmls-configs.linters.stylelint")
local stylelint_formatter = require("efmls-configs.formatters.stylelint")
local stylua = require("efmls-configs.formatters.stylua")
local clang_format = require("efmls-configs.formatters.clang_format")
local clang_tidy = require("efmls-configs.linters.clang_tidy")
local black = require("efmls-configs.formatters.black")
local isort = require("efmls-configs.formatters.isort")
local autopep8 = require("efmls-configs.formatters.autopep8")
local flake8 = require("efmls-configs.linters.flake8")
local latexindent = require("efmls-configs.formatters.latexindent")

local biome_customed = vim.tbl_extend("force", biome, {
	rootMarkers = { "biome.json" },
})

nvim_lsp.setup({
	init_options = {
		documentFormatting = true,
		codeAction = true,
	},
	filetypes = {
		"lua",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"css",
		"json",
		"python",
		"c",
		"cpp",
		"latex",
	},
	settings = {
		rootMarkers = { ".git/" },
		languages = vim.tbl_extend("force", languages, {
			lua = { stylua },
			javascript = { eslint_linter, biome_customed, prettier },
			typescript = { eslint_linter, biome_customed, prettier },
			javascriptreact = { eslint_linter, biome_customed, prettier },
			typescriptreact = { eslint_linter, biome_customed, prettier },
			css = { prettier, stylelint_formatter, stylelint_linter },
			json = { prettier },
			python = { black, isort, autopep8, flake8 },
			c = { clang_format, clang_tidy },
			cpp = { clang_format, clang_tidy },
			latex = { latexindent },
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
