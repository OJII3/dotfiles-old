local nvim_lsp = require("lspconfig").efm

local eslint = require("efmls-configs.linters.eslint")
local prettier = require("efmls-configs.formatters.prettier")
local biome = require("efmls-configs.formatters.biome")
local stylelint = require("efmls-configs.linters.stylelint")
local stylua = require("efmls-configs.formatters.stylua")
local clang_format = require("efmls-configs.formatters.clang_format")
local clang_tidy = require("efmls-configs.linters.clang_tidy")
local black = require("efmls-configs.formatters.black")
local isort = require("efmls-configs.formatters.isort")
local autopep8 = require("efmls-configs.formatters.autopep8")
local flake8 = require("efmls-configs.linters.flake8")

nvim_lsp.setup({
	init_options = {
		documentFormatting = true,
		codeAction = true,
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"css",
		"json",
		"lua",
		"python",
		"c",
		"cpp",
	},
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = { stylua },
			javascript = { eslint, prettier, biome },
			typescript = { eslint, prettier, biome },
			javascriptreact = { eslint, prettier, biome },
			typescriptreact = { eslint, prettier, biome },
			css = { stylelint },
			json = { biome },
			c = { clang_format, clang_tidy },
			cpp = { clang_format, clang_tidy },
			python = { black, isort, autopep8, flake8 },
		},
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
